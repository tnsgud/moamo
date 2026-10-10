import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookcaseSelectButton extends StatelessWidget {
  const BookcaseSelectButton({
    super.key,
    required this.bookcases,
    required this.selected,
    required this.onSelected,
  });

  final List<String> bookcases;
  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      position: PopupMenuPosition.under,
      color: AppColors.neutral05,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      padding: EdgeInsets.zero,
      onSelected: onSelected,
      itemBuilder: (context) => [
        for (var i = 0; i < bookcases.length; i++)
          PopupMenuItem(
            value: i,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bookcases[i],
                  style: i == selected
                      ? AppTextStyles.btn2Bold.copyWith(
                          color: AppColors.neutral90,
                        )
                      : AppTextStyles.btn2.copyWith(color: AppColors.neutral40),
                ),
                if (i == selected)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.primary08,
          borderRadius: AppRadius.sm,
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgIcon(name: 'sorting', size: AppIconSizes.xs),
            SizedBox(width: 6),
            Text(
              bookcases[selected],
              style: AppTextStyles.body1.copyWith(color: AppColors.neutral90),
            ),
          ],
        ),
      ),
    );
  }
}
