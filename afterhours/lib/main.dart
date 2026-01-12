import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home.dart';

void main() {
  runApp(const AfterHoursApp());
}

class AfterHoursApp extends StatelessWidget {
  const AfterHoursApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AfterHours',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
