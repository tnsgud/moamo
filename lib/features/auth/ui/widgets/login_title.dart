import 'package:flutter/material.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '반가워요!',
            style: AppTextStyles.h2Bold.copyWith(color: AppColors.neutral),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 50,
                right: -4,
                top: -6,
                bottom: -6,
                child: Image.asset(
                  'assets/images/text_highlighting.png',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                '오늘은 어떤 이야기를 모아볼까요?',
                style: AppTextStyles.h2.copyWith(color: AppColors.neutral),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
