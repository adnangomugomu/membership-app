import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/pages/register_page.dart';
import 'package:ifixied_membership_app/pages/register_page_2.dart';
import 'package:ifixied_membership_app/pages/register_page_3.dart';
import '../Pages/test_page.dart';
import '../pages/auth_page.dart';

final appRouter = GoRouter(
  initialLocation: '/test_page',
  routes: [
    GoRoute(path: '/test_page', builder: (context, state) => const TestPage()),
    GoRoute(path: '/auth_page', builder: (context, state) => const AuthPage()),
    GoRoute(path: '/register_page', builder: (context, state)=> const RegisterPage()),
    GoRoute(path: '/register_page_2', builder: (context, state)=> const RegisterPage2()),
    GoRoute(path: '/register_page_3', builder: (context, state)=> const RegisterPage3())
  ],
);
