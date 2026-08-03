import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_cupertino_sliding_bar.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class LoginPage extends StatelessWidget {
  final Widget child;

  const LoginPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;

    final selected = path.endsWith('/email') ? 'Email' : 'NomorPonsel';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWrapper.heading(
                  'Selamat datang di MyIfixied!',
                  textAlign: TextAlign.left,
                ),

                AppSpacing.sm,

                AppTextWrapper.body(
                  'Halo, Selamat datang Kembali',
                  textAlign: TextAlign.left,
                ),

                AppSpacing.lg,

                AppBarCupertinoSlidingBar<String>(
                  groupValue: selected,
                  onValueChanged: (value) {
                    if (value == null) return;

                    if (value == 'NomorPonsel') {
                      context.go('/login_page/phone');
                    } else {
                      context.go('/login_page/email');
                    }
                  },
                  children: const {
                    'NomorPonsel': Text('Nomor Ponsel'),
                    'Email': Text('Email'),
                  },
                ),

                AppSpacing.xl,

                SizedBox(width: double.infinity, child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
