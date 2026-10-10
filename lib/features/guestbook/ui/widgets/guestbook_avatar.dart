import 'package:flutter/widgets.dart';
import 'package:moamo/shared/theme/app_colors.dart';

// TODO: 프로필 이미지가 준비되면 교체
class GuestbookAvatar extends StatelessWidget {
  const GuestbookAvatar({super.key});

  static const double size = 32;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.profile,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.neutral0, width: 2),
      ),
    );
  }
}
