import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextWrapper.heading('Selamat datang di MyIfixied!'),
            AppTextWrapper.body('Daftar hanya dalam beberapa langkah mudah.'),
            AppTextField(label: 'Email', hintText: "Masukkan Email"),
            AppTextWrapper.heading(
              'Apakah anda punya kode referral?',
              textAlign: TextAlign.left,
            ),
            AppTextField(
              label: 'Kode Referral (opsional)',
              hintText: ('Contoh:MYIF5xxxx'),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
