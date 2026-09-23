import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration SPLASH_SCREEN_DURATION = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(SPLASH_SCREEN_DURATION, () {
      if (mounted) {
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary100,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.322),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '책으로 모이고, 이야기로 이어지는 곳',
                  style: AppTextStyles.body1Bold.copyWith(
                    color: AppColors.neutral0,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset('assets/images/logo.png'),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/splash_bottom.png'),
          ),
        ],
      ),
    );
  }
}
