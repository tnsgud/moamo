import 'package:flutter/widgets.dart';
import 'package:moamo/features/navigation/model/navigation_item.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

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
          SvgIcon(
            name: isSelected ? item.activeIconName : item.iconName,
            size: AppIconSizes.md,
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
