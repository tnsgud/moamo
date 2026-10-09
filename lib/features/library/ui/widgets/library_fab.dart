import 'package:flutter/widgets.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

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
            borderRadius: AppRadius.xl,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgIcon(name: 'guestbook', color: AppColors.neutral0),

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
          // 화면 본문(Navigator) 밖으로 나가면 잘리므로 오른쪽은 0
          right: 0,
          top: -4,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.notification,
              borderRadius: AppRadius.xxl,
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
