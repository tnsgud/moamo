import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:go_router/go_router.dart';

import 'package:dio/dio.dart';
import 'package:moamo/shared/network/api_client.dart';

import '../../../shared/api/models/data_sealed.dart';
import '../../../shared/api/models/kakao_login_request.dart';
import '../../../shared/api/models/signup_request.dart';
import '../../../shared/widget/app_toast.dart';
import '../../library/ui/library_home_screen.dart';
import 'kakao_login_service.dart';

Future<void> login(BuildContext context) async {
  try {
    final kakaoToken = await loginWithKakao();

    // 사용자가 취소함
    if (kakaoToken == null || !context.mounted) return;
    debugPrint('[Login] 카카오 토큰 수신 (${kakaoToken.length}자)');

    final res = await apiClient.auth.loginWithKakaoAccessToken(
      body: KakaoLoginRequest(kakaoAccessToken: kakaoToken),
    );

    // 서비스 accessToken. 신규 회원이면 가입을 마친 뒤의 토큰이다.
    final String? token = switch (res.data) {
      DataSealedLoginResponse(accessToken: final token) => token,
      DataSealedSignupRequiredResponse(signupToken: final signupToken) =>
        await _signup(signupToken),
    };
    if (token == null || !context.mounted) return;

    accessToken = token;
    debugPrint('[Login] 로그인 완료');
    context.go(LibraryHomeScreen.url);
  } catch (e) {
    debugPrint('[Login] 실패: $e');
    if (context.mounted) {
      showAppToast(context, '카카오 로그인에 실패했습니다.', isError: true);
    }
  }
}

/// 신규 회원 가입. 카카오 닉네임으로 `POST /api/auth/signup`을 호출하고,
/// 응답(LOGIN_SUCCESS)의 accessToken을 돌려준다. 닉네임을 쓸 수 없으면 null.
Future<String?> _signup(String signupToken) async {
  final res = await signupClient(
    signupToken,
  ).completeKakaoSignup(body: SignupRequest(nickname: '누군가'));
  debugPrint('[Login] 가입 완료 code=${res.code}');
  return res.data.accessToken;
}

/// 저장된 카카오 토큰으로 서비스 accessToken을 다시 받는다 (화면 없이).
///
/// 앱 시작(자동 로그인)과 401 응답 뒤 재시도에 쓴다. 서비스 토큰은 15분이고
/// 리프레시 토큰이 없어서, 카카오 토큰을 다시 보내 새로 받는 방식이다.
/// 카카오 토큰이 없거나 리프레시까지 만료됐으면 null (로그인 화면으로 보내야 함).
Future<String?> restoreSession() async {
  final manager = TokenManagerProvider.instance.manager;
  try {
    var kakao = await manager.getToken();
    if (kakao == null) return null;
    // 카카오 액세스 토큰이 곧 만료되면 리프레시 토큰으로 갱신한다.
    // (SDK의 refreshToken은 저장까지 해주지 않아서 직접 저장한다.)
    if (kakao.expiresAt.isBefore(DateTime.now().add(Duration(minutes: 1)))) {
      kakao = await AuthApi.instance.refreshToken(oldToken: kakao);
      await manager.setToken(kakao);
    }

    final res = await apiClient.auth.loginWithKakaoAccessToken(
      body: KakaoLoginRequest(kakaoAccessToken: kakao.accessToken),
    );
    // 가입 전 사용자면 자동 로그인 대상이 아니다.
    final data = res.data;
    if (data is! DataSealedLoginResponse) return null;
    accessToken = data.accessToken;
    return data.accessToken;
  } on KakaoException catch (e) {
    // 리프레시 토큰 만료·연결 끊김 등: 저장된 토큰을 지우고 다시 로그인하게 한다.
    debugPrint('[Auth] 카카오 토큰 갱신 실패: $e');
    await manager.clear();
    return null;
  } on DioException catch (e) {
    debugPrint('[Auth] 세션 복구 실패: ${e.response?.statusCode ?? e.type.name}');
    return null;
  }
}
