import 'package:flutter/material.dart';

class LeakInsights extends StatelessWidget {
  const LeakInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leak Insights')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SummaryCard(),
            const SizedBox(height: 24),
            Text(
              'Estimated Metrics',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: _MetricCard(
                    icon: Icons.straighten,
                    label: 'Distance',
                    value: '1.8 m',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    icon: Icons.timer,
                    label: 'Duration',
                    value: '2 hrs',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const _MetricCard(
              icon: Icons.warning,
              label: 'Risk Level',
              value: 'High',
              fullWidth: true,
            ),
            const SizedBox(height: 28),
            Text(
              'How this was inferred',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const Text(
              'These estimates are derived from moisture detection patterns '
              'and how long abnormal signals persisted. Results are indicative '
              'and meant to assist early action.',
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEF5350), Color(0xFFFF867C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Icon(Icons.water_damage, color: Colors.white, size: 36),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'High Risk Leak Detected',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Immediate attention recommended',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool fullWidth;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary.withOpacity(0.15),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
