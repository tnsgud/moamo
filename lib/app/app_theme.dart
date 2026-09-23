import 'package:flutter/material.dart';
import 'package:moamo/shared/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: 'NanumSquareNeo',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
  );

  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}
