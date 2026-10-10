import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class SortMenuButton extends StatelessWidget {
  const SortMenuButton({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final List<String> options;
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
        for (var i = 0; i < options.length; i++)
          PopupMenuItem(
            value: i,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options[i],
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgIcon(name: 'sorting', size: AppIconSizes.xs),
          SizedBox(width: 6),
          Text(
            options[selected],
            style: AppTextStyles.caption1Bold.copyWith(
              color: AppColors.neutral70,
            ),
          ),
        ],
      ),
    );
  }
}
