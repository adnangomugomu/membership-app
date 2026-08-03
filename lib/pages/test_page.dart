import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_cupertino_sliding_bar.dart';
import 'package:ifixied_membership_app/ui/components/app_navigation_bar.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';

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
      appBar: const AppBarComponent(
        title: 'AppBarTest',
      ),
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

            AppButton(
              onPressed: null,
              text: 'Testing disabled button',
            ),

            AppTextField(
              label: 'Test field',
              hintText: 'Fill with anything',
            ),

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
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}