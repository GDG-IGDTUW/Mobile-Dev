import 'package:flutter/material.dart';
import '../data/mock_leak_data.dart';
import 'leak_detail.dart';

class LeakHistory extends StatelessWidget {
  const LeakHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leak History')),
      body: ListView.builder(
        itemCount: mockLeaks.length,
        itemBuilder: (context, index) {
          final leak = mockLeaks[index];
          return ListTile(
            title: Text(leak.location),
            subtitle: Text('${leak.risk} • ${leak.time}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LeakDetail(leak: leak)),
              );
            },
          );
        },
      ),
    );
  }
}
