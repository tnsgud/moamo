import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moamo/app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  if (!kDebugMode) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
  runApp(const Moamo());
}
