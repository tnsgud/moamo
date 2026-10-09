import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookSearchAppBar extends StatelessWidget {
  const BookSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: SvgIcon(size: AppIconSizes.lg, name: 'back'),
      ),
      title: Text(
        '책 검색',
        style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
      ),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primary08,
            border: Border.all(color: AppColors.primary),
            borderRadius: AppRadius.sm,
          ),
          child: Text(
            '상세 검색',
            style: AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral90),
          ),
        ),
      ],
    );
  }
}
