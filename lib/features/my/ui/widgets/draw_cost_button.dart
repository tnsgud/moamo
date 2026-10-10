import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

/// "1회 뽑기 / 10회 연속" 버튼. [onTap]이 null이면 비활성 상태.
class DrawCostButton extends StatelessWidget {
  const DrawCostButton({
    super.key,
    required this.label,
    required this.cost,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final int cost;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    final (background, titleColor, costColor) = isSelected
        ? (AppColors.secondary100, AppColors.neutral0, AppColors.primary)
        : disabled
        ? (AppColors.neutral10, AppColors.neutral40, AppColors.neutral40)
        : (AppColors.neutral0, AppColors.neutral90, AppColors.neutral90);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: background,
          border: isSelected || disabled
              ? null
              : Border.all(color: AppColors.neutral15),
          borderRadius: AppRadius.lg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyles.subtitle.copyWith(color: titleColor),
            ),
            SizedBox(height: 4),
            Opacity(
              opacity: disabled && !isSelected ? 0.5 : 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('🍌'),
                  SizedBox(width: 8),
                  Text(
                    '$cost개',
                    style: AppTextStyles.subtitle.copyWith(color: costColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
