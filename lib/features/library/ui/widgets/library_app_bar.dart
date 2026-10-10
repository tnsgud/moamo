import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class LibraryAppBar extends StatelessWidget {
  const LibraryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(),
      centerTitle: false,
      title: Text(
        '누군가의 서재',
        style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
      ),
      actions: [
        SvgIcon(name: 'bookcase', size: AppIconSizes.lg),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => context.push('/book-search'),
          child: SvgIcon(name: 'search', size: AppIconSizes.lg),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => context.push('/notification'),
          child: SvgIcon(name: 'notice_active', size: AppIconSizes.lg),
        ),
      ],
    );
  }
}
