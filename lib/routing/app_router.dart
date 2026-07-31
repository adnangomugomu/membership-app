import 'package:go_router/go_router.dart';
import '../Pages/test_page.dart';

final appRouter = GoRouter(
  initialLocation: '/test_Page',
  routes: [
    GoRoute(
      path: '/test_Page',
      builder: (context, state) => const TestPage(),
    )
  ]
);