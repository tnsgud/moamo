import 'package:flutter/widgets.dart';

import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
  });

  final VoidCallback onTap;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.primary08,
          borderRadius: AppRadius.sm,
          border: Border.all(color: AppColors.primary),
        ),
        child: child,
      ),
    );
  }
}
