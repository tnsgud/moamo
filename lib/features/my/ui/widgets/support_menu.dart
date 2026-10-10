import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class SupportMenu extends StatelessWidget {
  const SupportMenu({super.key, required this.items});

  /// (라벨, 새 소식 여부) 목록.
  final List<(String label, bool hasNew)> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '고객센터',
          style: AppTextStyles.body1.copyWith(color: AppColors.neutral40),
        ),
        for (final (label, hasNew) in items)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Text(
                    label,
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.neutral90,
                    ),
                  ),
                  if (hasNew) ...[SizedBox(width: 8), _newBadge()],
                  Spacer(),
                  SvgIcon(name: 'next', size: AppIconSizes.md),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _newBadge() => Container(
    width: 18,
    height: 18,
    decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
    child: Center(
      child: Text(
        'N',
        style: AppTextStyles.caption2Bold.copyWith(
          color: AppColors.neutral90,
          fontSize: 8,
        ),
      ),
    ),
  );
}
