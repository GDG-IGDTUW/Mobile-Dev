import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuspectProfilePage extends StatelessWidget {
  final String name;
  final String role;
  final String motive;
  final String description;
  final IconData icon;

  const SuspectProfilePage({
    super.key,
    required this.name,
    required this.role,
    required this.motive,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suspect Profile',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red.shade100,
                child: Icon(icon, size: 40, color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            _infoTile('Role', role),
            _infoTile('Motive', motive),

            const SizedBox(height: 16),

            Text(
              'Investigation Notes',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }
}
