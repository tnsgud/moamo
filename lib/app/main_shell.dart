import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/navigation/ui/app_bottom_navigation.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppBaseSizes.bodyHorizontal,
          ),
          child: navigationShell,
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
