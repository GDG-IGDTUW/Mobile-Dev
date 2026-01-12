import 'package:flutter/material.dart';
import '../data/mock_rooms.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  Color _riskColor(String risk) {
    switch (risk) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  IconData _roomIcon(String name) {
    if (name.toLowerCase().contains('bath')) return Icons.bathtub;
    if (name.toLowerCase().contains('kitchen')) return Icons.kitchen;
    if (name.toLowerCase().contains('bed')) return Icons.bed;
    if (name.toLowerCase().contains('balcony')) return Icons.balcony;
    return Icons.meeting_room;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: rooms.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final room = rooms[index];
            final color = _riskColor(room.risk);

            return Card(
              elevation: 6,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: color.withOpacity(0.15),
                          child: Icon(_roomIcon(room.name), color: color),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          room.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        room.status,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Risk: ${room.risk}',
                      style: TextStyle(color: color, fontSize: 13),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
