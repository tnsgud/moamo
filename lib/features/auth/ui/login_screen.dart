import 'package:flutter/material.dart';
import 'package:moamo/shared/app_base_sizes.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_radius.dart';
import 'package:moamo/shared/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '반가워요!',
                      style: AppTextStyles.h2Bold.copyWith(
                        color: AppColors.neutral,
                      ),
                    ),
                    Text(
                      '오늘은 어떤 이야기를 모아볼까요?',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.neutral,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 46),
              Center(child: Image.asset('assets/images/login_character.png')),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Center(
                  child: Text(
                    '로그인',
                    style: AppTextStyles.subtitleBold.copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.secondary100,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Center(
                  child: Text(
                    '회원가입',
                    style: AppTextStyles.subtitleBold.copyWith(
                      color: AppColors.neutral0,
                    ),
                  ),
                ),
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
