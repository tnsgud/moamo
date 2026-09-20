import 'package:flutter/material.dart';
import 'package:moamo/app/app_theme.dart';
import 'package:moamo/app/router.dart';

class Moamo extends StatelessWidget {
  const Moamo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter, theme: AppTheme.light);
  }
}
