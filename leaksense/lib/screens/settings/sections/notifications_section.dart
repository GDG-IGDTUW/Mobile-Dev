import 'package:flutter/material.dart';

class NotificationsSection extends StatefulWidget {
  const NotificationsSection({super.key});

  @override
  State<NotificationsSection> createState() => _NotificationsSectionState();
}

class _NotificationsSectionState extends State<NotificationsSection> {
  bool leakAlerts = true;
  bool criticalOnly = false;
  bool vibration = true;

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      title: "Notifications",
      children: [
        SwitchListTile(
          title: const Text("Leak Alerts"),
          subtitle: const Text("Get notified when leaks are detected"),
          value: leakAlerts,
          onChanged: (val) {
            setState(() => leakAlerts = val);
          },
        ),
        SwitchListTile(
          title: const Text("Critical Alerts Only"),
          subtitle: const Text("Only notify for high-risk leaks"),
          value: criticalOnly,
          onChanged: (val) {
            setState(() => criticalOnly = val);
          },
        ),
        SwitchListTile(
          title: const Text("Vibration"),
          value: vibration,
          onChanged: (val) {
            setState(() => vibration = val);
          },
        ),
      ],
    );
  }
}