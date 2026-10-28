import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/auth/data/auth_service.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';
import 'package:moamo/features/library/ui/library_home_screen.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String url = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration splashScreenDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    _start();
  }

  /// 스플래시를 보여주는 동안 저장된 카카오 토큰으로 자동 로그인을 시도한다.
  Future<void> _start() async {
    final (token, _) = await (
      restoreSession(),
      Future.delayed(splashScreenDuration),
    ).wait;
    if (!mounted) return;
    context.go(token != null ? LibraryHomeScreen.url : LoginScreen.url);
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
