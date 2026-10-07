import 'package:flutter/material.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.name, required this.isSelected});

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondary100 : AppColors.neutral05,
        borderRadius: AppRadius.sm,
      ),
      child: Text(
        name,
        style: isSelected
            ? AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral0)
            : AppTextStyles.btn2.copyWith(color: AppColors.neutral50),
      ),
    );
  }
}
