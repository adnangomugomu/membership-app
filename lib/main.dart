import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_theme.dart';

import 'ui/components/app_button.dart';

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
        appBar: AppBar(title: const Text('Component Test')),

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
            ],
          ),
        ),
      ),
    );
  }
}
