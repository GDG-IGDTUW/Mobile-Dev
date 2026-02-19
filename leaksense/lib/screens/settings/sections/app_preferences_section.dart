import 'package:flutter/material.dart';

class AppPreferencesSection extends StatefulWidget {
  const AppPreferencesSection({super.key});

  @override
  State<AppPreferencesSection> createState() => _AppPreferencesSectionState();
}

class _AppPreferencesSectionState extends State<AppPreferencesSection> {
  bool darkMode = false;
  bool useMetricUnits = true;

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      title: "App Preferences",
      children: [
        SwitchListTile(
          title: const Text("Dark Mode"),
          value: darkMode,
          onChanged: (val) {
            setState(() => darkMode = val);
          },
        ),
        SwitchListTile(
          title: const Text("Use Metric Units"),
          subtitle: const Text("Litres instead of gallons"),
          value: useMetricUnits,
          onChanged: (val) {
            setState(() => useMetricUnits = val);
          },
        ),
      ],
    );
  }
}