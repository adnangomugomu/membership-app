import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_image_wrapper.dart';
import 'package:ifixied_membership_app/ui/components/app_otp_field.dart';

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
              AppImageWrapper(image: 'assets/image/OTP.png'),
              AppOtpField(
                onCompleted: (otp) {
                  print('OTP: $otp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
