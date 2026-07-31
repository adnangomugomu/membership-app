import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  // Vertical Spacing
  static const SizedBox xs = SizedBox(height: 4);
  static const SizedBox sm = SizedBox(height: 8);
  static const SizedBox md = SizedBox(height: 16);
  static const SizedBox lg = SizedBox(height: 24);
  static const SizedBox xl = SizedBox(height: 32);
  static const SizedBox xxl = SizedBox(height: 48);

  // Horizontal Spacing
  static const SizedBox horizontalXs = SizedBox(width: 4);
  static const SizedBox horizontalSm = SizedBox(width: 8);
  static const SizedBox horizontalMd = SizedBox(width: 16);
  static const SizedBox horizontalLg = SizedBox(width: 24);
  static const SizedBox horizontalXl = SizedBox(width: 32);
  static const SizedBox horizontalXxl = SizedBox(width: 48);

  // Custom Spacing
  static const SizedBox authHeader = SizedBox(height: 72);
  static const SizedBox section = SizedBox(height: 40);
}