import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      title: "Profile",
      children: [
        Row(
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
        const SizedBox(height: 12),
        ListTile(
          title: const Text("Edit Profile"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Logout"),
          onTap: () {},
        ),
      ],
    );
  }
}