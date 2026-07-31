import 'package:flutter/material.dart';

class AppImageWrapper extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;

  const AppImageWrapper({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        image,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}