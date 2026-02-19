import 'package:flutter/material.dart';
import 'sections/notifications_section.dart';
import 'sections/house_rooms_section.dart';
import 'sections/profile_section.dart';
import 'sections/app_preferences_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          NotificationsSection(),
          SizedBox(height: 12),
          HouseRoomsSection(),
          SizedBox(height: 12),
          ProfileSection(),
          SizedBox(height: 12),
          AppPreferencesSection(),
        ],
      ),
    );
  }
}