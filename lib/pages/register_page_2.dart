import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_checkbox.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2();
}

class _RegisterPage2 extends State<RegisterPage2> {
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
              AppTextField(label: 'Nama Lengkap', hintText: 'Kobo Kanaeru'),
              AppSpacing.lg,
              AppTextField(
                label: 'Nomor Ponsel',
                hintText: 'Contoh: 085XXXXXXXXX',
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
