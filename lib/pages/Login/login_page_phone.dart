import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';

class LoginPagePhone extends StatelessWidget {
  const LoginPagePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: 'Phone',
          hintText: '085XXXXXXXXX',
        ),

        AppSpacing.lg,

        AppButton(
          text: 'Kirim OTP',
          onPressed: () {context.go("/login_page/otp");},
        ),
      ],
    );
  }
}