import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import '../ui/components/app_image_wrapper.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImageWrapper(image: 'assets/image/authpage.png'),
              AppSpacing.xxl,
              AppTextWrapper.heading(
                'Selamat datang di My iFixied!',
                textAlign: TextAlign.center,
              ),
              AppTextWrapper.body(
                'Service Apple yang cepat dan andal. Siap membantu, kapan saja, di mana saja.',
                textAlign: TextAlign.center,
              ),
              AppSpacing.xl,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    AppButton(
                      text: 'Masuk',
                      onPressed: () {
                        context.go('/test_page');
                      },
                    ),
                    AppButton(
                      text: 'Daftar Sekarang',
                      onPressed: () {
                        context.go('/test_page');
                      },
                      isReversed: true,
                    ),
                  ],
                ),
              ),

              AppSpacing.xl,
              AppTextWrapper.body(
                'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan',
                textAlign: TextAlign.center,
              ),
              AppTextWrapper.body('Ketentuan layanan dan kebijakan privasi'),
            ],
          ),
        ),
      ),
    );
  }
}
