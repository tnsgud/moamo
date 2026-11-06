import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

/// 현재 정렬 기준을 글자로 보여 주고, 누르면 정렬 목록을 띄운다.
class SortButton extends StatelessWidget {
  const SortButton({
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
      child: Text(
        options[selected],
        style: AppTextStyles.caption1Bold.copyWith(color: AppColors.neutral70),
      ),
    );
  }
}
