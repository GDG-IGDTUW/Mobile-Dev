import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFEFF4F8),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1E88E5),
      primary: const Color(0xFF1E88E5),
      secondary: const Color(0xFF26C6DA),
      error: const Color(0xFFEF5350),
      background: const Color(0xFFF4F8FB),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 14),
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E88E5),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}
