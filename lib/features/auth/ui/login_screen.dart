import 'package:flutter/material.dart';

import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';

import 'package:moamo/features/auth/data/auth_service.dart';

import 'widgets/login_button.dart';
import 'widgets/login_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String url = '/login';

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
                onTap: () => login(context),
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
