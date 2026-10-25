import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
