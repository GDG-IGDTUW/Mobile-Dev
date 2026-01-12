import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const LeakSenseApp());
}

class LeakSenseApp extends StatelessWidget {
  const LeakSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeakSense',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Dashboard(),
    );
  }
}
