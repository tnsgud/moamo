import 'package:go_router/go_router.dart';
import 'package:moamo/features/auth/ui/login_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [GoRoute(path: '/login', builder: (context, state) => LoginScreen())],
);
