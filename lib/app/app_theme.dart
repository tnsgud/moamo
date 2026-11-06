import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';

abstract final class AppTheme {
  /// 화면을 열 때 오른쪽에서 밀려 들어오는 전환. 두 플랫폼을 똑같이 맞춘다.
  /// (iOS는 왼쪽 끝을 밀어서 뒤로 가기도 된다.)
  static const _pageTransitions = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static ThemeData get light => ThemeData(
    fontFamily: 'NanumSquareNeo',
    pageTransitionsTheme: _pageTransitions,
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
    pageTransitionsTheme: _pageTransitions,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}
