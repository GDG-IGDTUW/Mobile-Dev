import 'package:flutter/material.dart';
import '../models/leak_event.dart';

class LeakDetail extends StatelessWidget {
  final LeakEvent leak;
  const LeakDetail({super.key, required this.leak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leak Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${leak.location}'),
            Text('Risk: ${leak.risk}'),
            Text('Distance: ${leak.distance}'),
            Text('Duration: ${leak.duration}'),
            Text('Detected at: ${leak.time}'),
          ],
        ),
      ),
    );
  }
}
