import 'package:flutter/material.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_text_styles.dart';

class LibraryHomeScreen extends StatelessWidget {
  const LibraryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '책장',
        style: AppTextStyles.body1.copyWith(color: AppColors.blue),
      ),
    );
  }
}
