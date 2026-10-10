import 'package:flutter/material.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class CommunityTabHeader extends StatelessWidget {
  const CommunityTabHeader({
    super.key,
    required this.tabs,
    required this.selected,
    required this.onSelected,
  });

  final List<String> tabs;
  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppBarTheme.of(context).toolbarHeight,
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++) ...[
            if (i > 0) SizedBox(width: 8),
            GestureDetector(
              onTap: () => onSelected(i),
              child: i == selected ? _selected(tabs[i]) : _unselected(tabs[i]),
            ),
          ],
        ],
      ),
    );
  }

  Widget _selected(String label) => Row(
    children: [
      Text('“', style: AppTextStyles.h3Bold.copyWith(color: AppColors.primary)),
      Text(
        label,
        style: AppTextStyles.h3Bold.copyWith(color: AppColors.neutral90),
      ),
      Text('”', style: AppTextStyles.h3Bold.copyWith(color: AppColors.primary)),
    ],
  );

  Widget _unselected(String label) =>
      Text(label, style: AppTextStyles.h3.copyWith(color: AppColors.neutral40));
}
