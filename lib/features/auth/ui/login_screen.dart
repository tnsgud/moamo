import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:moamo/features/auth/data/kakao_login_service.dart';
import 'package:moamo/features/auth/ui/widgets/login_button.dart';
import 'package:moamo/shared/api/models/data_sealed.dart';
import 'package:moamo/features/library/ui/library_home_screen.dart';
import 'package:moamo/shared/api/models/kakao_login_request.dart';
import 'package:moamo/shared/api/models/signup_request.dart';
import 'package:moamo/shared/network/api_client.dart';

import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/widget/app_toast.dart';

import 'widgets/login_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String url = '/login';

  Future<void> _login(BuildContext context) async {
    try {
      final kakaoToken = await loginWithKakao();
      if (kakaoToken == null || !context.mounted) return; // 사용자가 취소함
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
    final nickname = (await fetchKakaoNickname())?.trim();
    // 서버 규칙: 앞뒤 공백 제거 후 2~20자
    if (nickname == null || nickname.length < 2 || nickname.length > 20) {
      // TODO: 닉네임 입력 화면 또는 기본 닉네임 생성으로 대체
      debugPrint('[Login] 사용할 수 없는 카카오 닉네임: $nickname');
      return null;
    }

    final res = await signupClient(
      signupToken,
    ).completeKakaoSignup(body: SignupRequest(nickname: nickname));
    debugPrint('[Login] 가입 완료 code=${res.code}');
    return res.data.accessToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppBaseSizes.bodyHorizontal),
        child: Align(
          alignment: Alignment(0, 0.39),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTitle(),
              SizedBox(height: 46),
              Center(child: Image.asset('assets/images/login_character.png')),
              SizedBox(height: 30),
              LoginButton(
                title: '로그인',
                bgColor: AppColors.primary,
                textColor: AppColors.neutral,
                onTap: () => _login(context),
              ),
              SizedBox(height: 8),
              LoginButton(
                title: '회원가입',
                bgColor: AppColors.secondary100,
                textColor: AppColors.neutral0,
                onTap: () => {},
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  '아이디/ 비밀번호 찾기',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
