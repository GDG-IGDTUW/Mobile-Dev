import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EvidenceViewerPage extends StatelessWidget {
  final String title;
  final String description;
  final String example;

  const EvidenceViewerPage({
    super.key,
    required this.title,
    required this.description,
    required this.example,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Evidence File',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              description,
              style: GoogleFonts.poppins(fontSize: 14),
            ),

            const SizedBox(height: 20),

            Text(
              'Exhibit',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                example,
                style: GoogleFonts.sourceCodePro(
                  color: Colors.greenAccent,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
