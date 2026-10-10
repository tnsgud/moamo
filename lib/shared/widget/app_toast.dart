import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

void showAppToast(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: isError ? AppColors.neutral70 : AppColors.secondary100,
        shape: StadiumBorder(),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        content: Row(
          children: [
            SvgIcon(name: 'info_none', size: AppIconSizes.md),
            SizedBox(width: 12),
            Text(
              message,
              style: AppTextStyles.btn2.copyWith(color: AppColors.neutral0),
            ),
          ],
        ),
      ),
    );
}
