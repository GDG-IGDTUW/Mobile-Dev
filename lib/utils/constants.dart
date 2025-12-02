import 'package:flutter/material.dart';

// App Colors - Vibrant gradient theme
class AppColors {
  static const primaryPurple = Color(0xFF6C63FF);
  static const primaryPink = Color(0xFFFF6B9D);
  static const primaryBlue = Color(0xFF4FACFE);
  static const accentOrange = Color(0xFFFFB26B);
  static const accentGreen = Color(0xFF00F5A0);
  
  static const darkBg = Color(0xFF1A1A2E);
  static const cardBg = Color(0xFF16213E);
  static const textPrimary = Color(0xFF2D3142);
  static const textSecondary = Color(0xFF9094A6);
  static const white = Color(0xFFFFFFFF);
  
  // Gradients
  static const primaryGradient = LinearGradient(
    colors: [primaryPurple, primaryPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const accentGradient = LinearGradient(
    colors: [primaryBlue, accentGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const backgroundGradient = LinearGradient(
    colors: [Color(0xFFF8F9FF), Color(0xFFFFE5F1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// Text Styles
class AppTextStyles {
  static const headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );
  
  static const headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const body1 = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );
  
  static const body2 = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
  
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}

// Spacing
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

// Border Radius
class AppRadius {
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}