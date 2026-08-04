import 'package:flutter/material.dart';

class AppTextWrapper extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  const AppTextWrapper._({
    super.key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.center,
  });

  factory AppTextWrapper.heading(
    String text, {
    Key? key,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppTextWrapper._(
      key: key,
      text: text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  factory AppTextWrapper.title(
    String text, {
    Key? key,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppTextWrapper._(
      key: key,
      text: text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  factory AppTextWrapper.body(
    String text, {
    Key? key,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppTextWrapper._(
      key: key,
      text: text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 13,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}