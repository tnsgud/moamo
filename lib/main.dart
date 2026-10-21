import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:moamo/app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moamo/features/auth/data/kakao_login_service.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kDebugMode) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
  await KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  runApp(const Moamo());
}
