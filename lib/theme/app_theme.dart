import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: Colors.white,

    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().textTheme,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,

        disabledBackgroundColor: AppColors.disabledbuttonbackground,
        disabledForegroundColor: AppColors.buttonText
      ),
    ),
  );
}