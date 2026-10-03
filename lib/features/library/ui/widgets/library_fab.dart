import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_radius.dart';
import 'package:moamo/shared/app_text_styles.dart';

class LibraryFab extends StatelessWidget {
  const LibraryFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.secondary100,
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/guestbook.svg',
                colorFilter: ColorFilter.mode(
                  AppColors.neutral0,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 6),
              Text(
                '방명록',
                style: AppTextStyles.btn2Bold.copyWith(
                  color: AppColors.neutral0,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -4,
          top: -4,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.notification,
              borderRadius: BorderRadius.circular(AppRadius.xxl),
            ),
            child: Center(
              child: Text(
                'N',
                style: AppTextStyles.caption2Bold.copyWith(
                  color: AppColors.neutral0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
