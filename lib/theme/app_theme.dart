import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: Colors.white,

    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),

    appBarTheme: AppBarTheme(
      foregroundColor: const Color.fromARGB(255, 255, 250, 250),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,

        disabledBackgroundColor: AppColors.disabledbuttonbackground,
        disabledForegroundColor: AppColors.buttonText,
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      labelStyle: TextStyle(
        color: AppColors.primary
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
  );
}
