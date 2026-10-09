import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: 'NanumSquareNeo',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.neutral0,
    appBarTheme: AppBarTheme(
      toolbarHeight: AppBaseSizes.headerHeight,
      actionsPadding: EdgeInsets.zero,
      backgroundColor: AppColors.neutral0,
      leadingWidth: AppIconSizes.lg,
      centerTitle: true,
    ),
  );

  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}
