import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class AppDialogAction {
  const AppDialogAction({
    required this.label,
    required this.onTap,
    this.isPrimary = true,
  });

  final String label;
  final VoidCallback onTap;
  final bool isPrimary;
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.icon,
    required this.title,
    this.description,
    required this.actions,
  });

  final Widget? icon;
  final String title;
  final String? description;
  final List<AppDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.neutral0,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.xl),
      child: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ?icon,
            if (icon != null) SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.subtitleBold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            if (description != null) ...[
              SizedBox(height: 8),
              Text(
                description!,
                style: AppTextStyles.body1.copyWith(color: AppColors.neutral40),
              ),
            ],
            SizedBox(height: 20),
            Row(
              children: [
                for (var i = 0; i < actions.length; i++) ...[
                  if (i > 0) SizedBox(width: 8),
                  Expanded(child: _button(actions[i])),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(AppDialogAction action) => GestureDetector(
    onTap: action.onTap,
    child: Container(
      height: 36,
      decoration: BoxDecoration(
        color: action.isPrimary ? AppColors.primary : AppColors.neutral10,
        borderRadius: AppRadius.xs,
      ),
      child: Center(
        child: Text(
          action.label,
          style: AppTextStyles.body1Bold.copyWith(color: AppColors.neutral90),
        ),
      ),
    ),
  );
}
