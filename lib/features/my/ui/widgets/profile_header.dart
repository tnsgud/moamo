import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.nickname});

  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: 프로필 이미지로 교체
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: AppColors.profile,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.neutral15, width: 2),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            nickname,
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral60),
          ),
        ),
        SvgIcon(name: 'next', size: AppIconSizes.md),
      ],
    );
  }
}
