import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifixied_membership_app/pages/MainPage/home_page.dart';

import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_cupertino_sliding_bar.dart';
import 'package:ifixied_membership_app/ui/components/app_navigation_bar.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_otp_field.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ifixied_membership_app/ui/components/bar/app_bar_user.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String selected = 'KoboKanaeru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarUser(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              text: 'Testing button long',
              onPressed: () {
                context.go('/auth_page');
              },
            ),

            AppButton(text: 'Card test page', onPressed: (){context.go("/test_page/card");}),

            AppButton(
              onPressed: (){context.go('/home_page');},
              text: 'HomePage',
              icon: const FaIcon(FontAwesomeIcons.house),
            ),

            AppTextField(label: 'Test field', hintText: 'Fill with anything'),

            AppBarCupertinoSlidingBar<String>(
              groupValue: selected,
              onValueChanged: (value) {
                if (value == null) return;

                setState(() {
                  selected = value;
                });
              },
              children: const {
                'KoboKanaeru': Text('Kobo Kanaeru'),
                'VestiaZeta': Text('Vestia Zeta'),
              },
            ),
            AppOtpField(
              onCompleted: (otp) {
                print('OTP: $otp');
              },
            ),
          ],
        ),
      ),
    );
  }
}
