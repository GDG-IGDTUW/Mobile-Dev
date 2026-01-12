import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tips & Actions')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TipCard(
            icon: Icons.warning,
            title: 'Immediate Action',
            points: [
              'Shut off the main water supply',
              'Avoid electrical areas',
              'Keep the area dry if possible',
            ],
          ),
          const SizedBox(height: 12),
          _TipCard(
            icon: Icons.build,
            title: 'What to Do Next',
            points: [
              'Inspect nearby pipes',
              'Call a professional if leak persists',
              'Monitor affected area',
            ],
          ),
          const SizedBox(height: 12),
          _TipCard(
            icon: Icons.shield,
            title: 'Prevention Tips',
            points: [
              'Regular pipe inspection',
              'Check moisture-prone areas',
              'Avoid excessive water pressure',
            ],
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> points;

  const _TipCard({
    required this.icon,
    required this.title,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...points.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text('• $p'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
