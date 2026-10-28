import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:moamo/app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moamo/app/router.dart';
import 'package:moamo/features/auth/data/auth_service.dart';
import 'package:moamo/features/auth/data/kakao_login_service.dart';
import 'package:moamo/features/auth/data/secure_token_manager.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';
import 'package:moamo/shared/network/api_client.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kDebugMode) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
  await KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  // 카카오 토큰은 OS 보안 저장소(Keychain/Keystore)에 둔다.
  TokenManagerProvider.instance.manager = SecureTokenManager();
  // 서비스 토큰(15분)이 만료되면 저장된 카카오 토큰으로 다시 받는다.
  onRefreshToken = restoreSession;
  onSessionExpired = () => appRouter.go(LoginScreen.url);
  runApp(const ProviderScope(child: Moamo()));
}
