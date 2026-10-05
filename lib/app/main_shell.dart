import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/library/ui/widgets/library_fab.dart';
import 'package:moamo/features/navigation/ui/app_bottom_navigation.dart';
import 'package:moamo/shared/app_base_sizes.dart';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          AppBaseSizes.bodyHorizontal,
          MediaQuery.paddingOf(context).top,
          AppBaseSizes.bodyHorizontal,
          0,
        ),

        child: navigationShell,
      ),
      floatingActionButton: path == '/library' ? LibraryFab() : null,
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
