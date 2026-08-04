import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/pages/Login/login_otp_page.dart';
import 'package:ifixied_membership_app/pages/Login/login_page_email.dart';
import 'package:ifixied_membership_app/pages/Login/login_page.dart';
import 'package:ifixied_membership_app/pages/Login/login_page_phone.dart';

import 'package:ifixied_membership_app/pages/RegisterPage/register_page.dart';
import 'package:ifixied_membership_app/pages/RegisterPage/register_page_2.dart';
import 'package:ifixied_membership_app/pages/RegisterPage/register_page_3.dart';
import 'package:ifixied_membership_app/pages/TestPage/card_test_page.dart';
import 'package:ifixied_membership_app/pages/TestPage/test_page.dart';
import '../pages/auth_page.dart';

final appRouter = GoRouter(
  initialLocation: '/test_page',
  routes: [
    GoRoute(
      path: '/test_page',
      builder: (context, state) => const TestPage(),
    ),

    GoRoute(
      path: '/test_page/card',
      builder: (context, state) => const CardTestPage(),
    ),

    GoRoute(
      path: '/auth_page',
      builder: (context, state) => const AuthPage(),
    ),

    GoRoute(
      path: '/register_page',
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: '/register_page_2',
      builder: (context, state) => const RegisterPage2(),
    ),

    GoRoute(
      path: '/register_page_3',
      builder: (context, state) => const RegisterPage3(),
    ),

    GoRoute(
      path: '/login_page/otp',
      builder: (context, state) => const LoginOtpPage(),
    ),

    // Login Shell
    ShellRoute(
      builder: (context, state, child) {
        return LoginPage(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/login_page/email',
          builder: (context, state) {
            return const LoginPageEmail();
          },
        ),

        GoRoute(
          path: '/login_page/phone',
          builder: (context, state) {
            return const LoginPagePhone();
          },
        ),
      ],
    ),
  ],
);