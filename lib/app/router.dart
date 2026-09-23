import 'package:go_router/go_router.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';
import 'package:moamo/features/splash/ui/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  ],
);
