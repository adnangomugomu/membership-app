import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isReversed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: isReversed
            ? ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.buttonBackground,
                side: const BorderSide(
                  color: AppColors.buttonBackground,
                  width: 1
                )
              )
            : null,
      ),
    );
  }
}
