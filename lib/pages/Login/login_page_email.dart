import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class LoginPageEmail extends StatelessWidget {
  const LoginPageEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: 'Email',
          hintText: 'Masukkan Email',
        ),

        AppSpacing.lg,

        AppTextField(label: 'Password', hintText: "Masukan Password",),

        AppSpacing.lg,
  
        AppButton(
          text: 'Kirim OTP',
          onPressed: () {context.go('/test_page');},
        ),

        AppSpacing.lg,
        
        AppTextWrapper.body("Atau masuk dengan Google", textAlign: TextAlign.center,),

        AppSpacing.lg,

        AppButton(
          text: 'Google',
          isReversed: true,
          icon: const FaIcon(FontAwesomeIcons.google),
          onPressed: (){},
        )
      ],
    );
  }
}