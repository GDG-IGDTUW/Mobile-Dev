import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  CircleAvatar(radius: 26, child: Icon(Icons.person, size: 28)),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home Owner',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'LeakSense User',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Preferences',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: Text('Notifications'),
                  subtitle: Text('Get alerts for leak detection'),
                  value: true,
                  onChanged: (_) {},
                ),
                Divider(height: 1),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  subtitle: Text('Reduce brightness at night'),
                  value: false,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('About', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About LeakSense'),
              subtitle: Text('Version 1.0'),
            ),
          ),
        ],
      ),
    );
  }
}
