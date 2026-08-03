import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_checkbox.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
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
              AppTextField(label: 'Email', hintText: 'Masukkan Email'),
              AppSpacing.lg,
              AppTextWrapper.heading(
                'Apakah anda punya kode referral?',
                textAlign: TextAlign.left,
              ),
              AppSpacing.lg,
              AppTextField(
                label: 'Kode Referral (opsional)',
                hintText: 'Contoh: MYIF5xxxx',
              ),
              AppSpacing.lg,
              AppCheckbox(
                value: isApproved,
                onChanged: (value) {
                  setState(() {
                    isApproved = value ?? false;
                  });
                },
                label: const Text(
                  'Saya menyetujui ketentuan layanan & Kebijakan privasi MyIfixied',
                ),
              ),
              AppSpacing.lg,
              AppButton(
                text: 'Lanjutkan',
                onPressed: () {
                  context.go('/register_page_2');
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
