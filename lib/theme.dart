import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF15BC88); // Updated Green
  static const Color secondary = Color(0xFF1976D2); // Blue (Quick Fix, Button)
  static const Color error = Color(0xFFD32F2F); // Red (Warning, Issue)
  static const Color warning = Color(0xFFFFA000); // Orange (Effects)
  static const Color background = Color(0xFFF8F9FB); // Light background
  static const Color card = Color(0xFFFFFFFF); // Card/Container background
  static const Color accent = Color(0xFF15BC88); // Accent matches primary
  static const Color grey = Color(0xFFBDBDBD); // Progress Bar background
  static const Color lightBlue = Color(0xFFE3F2FD); // Quick Fix background
  static const Color lightGreen = Color(0xFFD9F5EC); // Lighter variant of new green
  static const Color lightRed = Color(0xFFFFEBEE); // Issue background
}

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    background: AppColors.background,
  ),
  cardColor: AppColors.card,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
  ),
); 