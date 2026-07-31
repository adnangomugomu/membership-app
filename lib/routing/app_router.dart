import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/pages/register_page.dart';
import '../Pages/test_page.dart';
import '../pages/auth_page.dart';

final appRouter = GoRouter(
  initialLocation: '/test_page',
  routes: [
    GoRoute(path: '/test_page', builder: (context, state) => const TestPage()),
    GoRoute(path: '/auth_page', builder: (context, state) => const AuthPage()),
    GoRoute(path: '/register_page', builder: (context, state)=> const RegisterPage())
  ],
);
