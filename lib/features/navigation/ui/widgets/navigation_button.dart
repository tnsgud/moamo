import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moamo/features/navigation/model/navigation_item.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_icon_sizes.dart';
import 'package:moamo/shared/app_text_styles.dart';

class NavigationButton extends StatelessWidget {
  final NavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const NavigationButton({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isSelected ? item.activeIconPath : item.iconPath,
            width: AppIconSizes.md,
            height: AppIconSizes.md,
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            style: isSelected
                ? AppTextStyles.caption2Bold.copyWith(
                    color: AppColors.neutral70,
                  )
                : AppTextStyles.caption2.copyWith(color: AppColors.neutral50),
          ),
        ],
      ),
    );
  }
}
