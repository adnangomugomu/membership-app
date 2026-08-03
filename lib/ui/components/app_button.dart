import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isReversed;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isReversed = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: isReversed
            ? ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.buttonBackground,
                side: const BorderSide(
                  color: AppColors.buttonBackground,
                  width: 1,
                ),
              )
            : null,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(text),
                ],
              )
            : Text(text),
      ),
    );
  }
}