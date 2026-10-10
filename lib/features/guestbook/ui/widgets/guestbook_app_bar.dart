import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class GuestbookAppBar extends StatelessWidget {
  const GuestbookAppBar({super.key, required this.title, required this.count});

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.neutral15, width: 0.5),
        ),
      ),
      child: AppBar(
        toolbarHeight: 64,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: SvgIcon(name: 'back', size: AppIconSizes.lg),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
            ),
            Text(
              '총 $count개의 방명록',
              style: AppTextStyles.caption1.copyWith(
                color: AppColors.neutral40,
              ),
            ),
          ],
        ),
        actions: [
          SvgIcon(
            name: 'setting',
            size: AppIconSizes.lg,
            color: AppColors.neutral40,
          ),
        ],
      ),
    );
  }
}
