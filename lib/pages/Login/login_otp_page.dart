import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/theme/app_spacing.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_image_wrapper.dart';
import 'package:ifixied_membership_app/ui/components/app_otp_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_wrapper.dart';

class LoginOtpPage extends StatefulWidget {
  const LoginOtpPage({super.key});

  @override
  State<LoginOtpPage> createState() => _loginOtpPage();
}

class _loginOtpPage extends State<LoginOtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    AppImageWrapper(image: 'assets/image/OTP.png'),
                    AppSpacing.lg,
                    AppTextWrapper.heading('Kode OTP telah terkirim'),
                    AppSpacing.lg,
                    AppTextWrapper.body("Masukkan kode OTP yang telah kami kirimkan ke email",textAlign: TextAlign.center,),
                    AppSpacing.lg,
                    AppOtpField(
                      onCompleted: (otp) {
                        print('OTP: $otp');
                      },
                    ),
                    AppSpacing.lg,
                    AppButton(text: "Lanjutkan", onPressed: (){context.go('/test_page');}),
                    AppSpacing.lg,
                    AppTextWrapper.body('Kirim ulang OTP (00:40)')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
