import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_theme.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';
import 'package:ifixied_membership_app/ui/components/app_navigation_bar.dart';

import 'ui/components/app_button.dart';
import 'ui/components/app_text_field.dart';

import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,

      home: Scaffold(
        appBar: AppBarComponent(title: "AppBarTest"),
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
              AppButton(onPressed: null, text: 'testing disabled button'),
              AppTextField(
                label: 'Test field',
                hintText: "Fill with anything",
              )
            ],
          ),
        ),
        bottomNavigationBar: AppNavigationBar(currentIndex: 0),
      ),
    );
  }
}
