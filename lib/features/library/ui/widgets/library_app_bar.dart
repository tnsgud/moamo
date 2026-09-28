import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moamo/shared/app_base_sizes.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_icon_sizes.dart';
import 'package:moamo/shared/app_text_styles.dart';

class LibraryAppBar extends StatelessWidget {
  const LibraryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppBaseSizes.headerHeight,
      child: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '누군가의 서재',
              style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
            ),
          ),
          SvgPicture.asset(
            'assets/icons/bookcase.svg',
            width: AppIconSizes.lg,
            height: AppIconSizes.lg,
          ),
          SizedBox(width: 10),
          SvgPicture.asset(
            'assets/icons/search.svg',
            width: AppIconSizes.lg,
            height: AppIconSizes.lg,
          ),
          SizedBox(width: 10),
          SvgPicture.asset(
            'assets/icons/notice_active.svg',
            width: AppIconSizes.lg,
            height: AppIconSizes.lg,
          ),
        ],
      ),
    );
  }
}
