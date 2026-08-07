import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/pages/DetailsPage/tracking_details_page.dart';
import 'package:ifixied_membership_app/pages/DetailsPage/transaction_details_page.dart';
import 'package:ifixied_membership_app/pages/Login/login_otp_page.dart';
import 'package:ifixied_membership_app/pages/Login/login_page_email.dart';
import 'package:ifixied_membership_app/pages/Login/login_page.dart';
import 'package:ifixied_membership_app/pages/Login/login_page_phone.dart';
import 'package:ifixied_membership_app/pages/MainPage/price_list_page.dart';
import 'package:ifixied_membership_app/pages/MainPage/promo_page.dart';
import 'package:ifixied_membership_app/pages/MainPage/receipt_page.dart';
import 'package:ifixied_membership_app/pages/MainPage/tracking_page.dart';

import 'package:ifixied_membership_app/pages/RegisterPage/register_page.dart';
import 'package:ifixied_membership_app/pages/RegisterPage/register_page_2.dart';
import 'package:ifixied_membership_app/pages/RegisterPage/register_page_3.dart';
import 'package:ifixied_membership_app/pages/TestPage/card_test_page.dart';
import 'package:ifixied_membership_app/pages/TestPage/test_page.dart';
import 'package:ifixied_membership_app/pages/MainPage/home_page.dart';
import 'package:ifixied_membership_app/pages/main_shell_page.dart';
import '../pages/auth_page.dart';

final appRouter = GoRouter(
  initialLocation: '/test_page',
  routes: [
    GoRoute(path: '/test_page', builder: (context, state) => const TestPage()),

    GoRoute(
      path: '/test_page/card',
      builder: (context, state) => const CardTestPage(),
    ),

    GoRoute(path: '/auth_page', builder: (context, state) => const AuthPage()),

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
        return LoginPage(child: child);
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
    // Main shell
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShellPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home_page',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/promo',
              builder: (context, state) => const PromoPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/pricelist',
              builder: (context, state) => const PriceListPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/receipt',
              builder: (context, state) => const ReceiptPage(),
            ),
            GoRoute(
              path: '/receipt/detais',
              builder: (context, state) => const TransactionDetailPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tracking',
              builder: (context, state) => const TrackingPage(),
            ),
            GoRoute(
              path: '/tracking/details',
              builder: (context, state) => const ServiceDetailTrackingPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
