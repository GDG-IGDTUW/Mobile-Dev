import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF0B0B0F),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFD4AF37),
      secondary: Color(0xFFF5E6A8),
      surface: Color(0xFF16161D),
      background: Color(0xFF0B0B0F),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xFFD4AF37),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Color(0xFFD4AF37)),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Color(0xFFEDEDED),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFFEDEDED),
      ),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFA1A1AA)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 36),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
