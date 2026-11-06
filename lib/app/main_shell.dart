import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/navigation/ui/app_bottom_navigation.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';

class MainShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell>
    with SingleTickerProviderStateMixin {
  /// 탭을 바꾸면 새 탭을 살짝 페이드인한다.
  /// 탭 화면 자체는 그대로 두고 투명도만 바꿔서, 각 탭의 상태(스크롤 등)는 유지된다.
  late final _fade = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
    value: 1,
  );
  late final _opacity = CurvedAnimation(parent: _fade, curve: Curves.easeOut);

  @override
  void didUpdateWidget(MainShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigationShell.currentIndex !=
        widget.navigationShell.currentIndex) {
      _fade.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _opacity.dispose();
    _fade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationShell = widget.navigationShell;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppBaseSizes.bodyHorizontal,
          ),
          // 화면이 밀려 들어올 때 좌우 여백 밖으로 그려지지 않게 자른다.
          child: ClipRect(
            child: FadeTransition(opacity: _opacity, child: navigationShell),
          ),
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
