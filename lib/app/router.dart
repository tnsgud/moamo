import 'package:go_router/go_router.dart';
import 'package:moamo/app/main_shell.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';
import 'package:moamo/features/certification/ui/certification_screen.dart';
import 'package:moamo/features/community/ui/community_main_screen.dart';
import 'package:moamo/features/library/ui/library_home_screen.dart';
import 'package:moamo/features/my/ui/my_screen.dart';
import 'package:moamo/features/splash/ui/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => LibraryHomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/community',
              builder: (context, state) => CommunityMainScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/certification',
              builder: (context, state) => CertificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/my', builder: (context, state) => MyScreen()),
          ],
        ),
      ],
    ),
  ],
);
