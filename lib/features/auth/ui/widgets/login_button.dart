import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
  });

  final String title;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: bgColor, borderRadius: AppRadius.md),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.subtitleBold.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
