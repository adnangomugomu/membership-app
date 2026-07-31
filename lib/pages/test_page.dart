import 'package:flutter/material.dart';

import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_navigation_bar.dart';
import 'package:ifixied_membership_app/ui/components/app_button.dart';
import 'package:ifixied_membership_app/ui/components/app_text_field.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

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
                print('Button clicked');
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
          ],
        ),
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}