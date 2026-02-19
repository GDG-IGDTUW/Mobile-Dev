import 'package:flutter/material.dart';

class HouseRoomsSection extends StatelessWidget {
  const HouseRoomsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      title: "House & Rooms",
      children: [
        ListTile(
          title: const Text("Manage Rooms"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Add New Room"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
      ],
    );
  }
}