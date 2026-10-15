import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

/// 뽑기 카드 위에 걸터앉은 캐릭터와 말풍선.
class DrawMascot extends StatelessWidget {
  const DrawMascot({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // TODO: 캐릭터 이미지로 교체
          Container(
            width: 88,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.profile,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
                bottom: Radius.circular(12),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.neutral0,
                borderRadius: AppRadius.md,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 8,
                    color: AppColors.neutral90.withValues(alpha: 0.12),
                  ),
                ],
              ),
              child: Text(
                message,
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
