import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_checkbox.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3();
}

class _RegisterPage3 extends State<RegisterPage3> {
  bool isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                'Daftar hanya dalam beberapa langkah.',
                textAlign: TextAlign.left,
              ),
              AppSpacing.lg,
              AppTextField(label: 'Password', hintText: 'Masukkan Password'),
              AppSpacing.lg,
              AppTextField(
                label: 'Konfirmasi Password',
                hintText: 'Ulangi Password',
              ),
              AppSpacing.lg,
              AppButton(
                text: 'Lanjutkan',
                onPressed: () {
                  context.go('/test_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
