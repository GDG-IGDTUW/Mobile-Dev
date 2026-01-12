import 'package:flutter/material.dart';
import 'leak_insights.dart';
import 'leak_history.dart';
import 'tips.dart';
import 'rooms.dart';
import 'settings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LeakSense')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _StatusCard(),
            const SizedBox(height: 28),
            Text('Actions', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),

            _ActionTile(
              icon: Icons.home,
              title: 'My Home',
              subtitle: 'View rooms and leak status',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RoomsScreen()),
                );
              },
            ),

            _ActionTile(
              icon: Icons.insights,
              title: 'Leak Insights',
              subtitle: 'View predicted risk and estimates',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LeakInsights()),
                );
              },
            ),

            _ActionTile(
              icon: Icons.history,
              title: 'Leak History',
              subtitle: 'Past detected events',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LeakHistory()),
                );
              },
            ),

            _ActionTile(
              icon: Icons.tips_and_updates,
              title: 'Tips & Actions',
              subtitle: 'What to do next',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TipsScreen()),
                );
              },
            ),

            _ActionTile(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Preferences and profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E88E5), Color(0xFF64B5F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: const [
          Icon(Icons.water_damage, color: Colors.white, size: 36),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leak Detected',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'High risk • Immediate attention recommended',
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

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.secondary.withOpacity(0.15),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
