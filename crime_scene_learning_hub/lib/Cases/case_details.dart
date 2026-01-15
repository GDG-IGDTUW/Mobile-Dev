import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:crime_scene_learning_hub/model/crime_case_model.dart';
import 'all_cases.dart';
import 'evidence_viewer.dart';
import 'suspect_profile.dart';

class CaseDetailsPage extends StatelessWidget {
  final CrimeCase caseData;

  const CaseDetailsPage({super.key, required this.caseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildCrimeReport(),
              _buildSuspects(context),
              _buildEvidenceTrail(context),
              _buildVerdict(),
              const SizedBox(height: 40),
            ]),
          ),
        ],
      ),
    );
  }

  // ------------------------------
  // App Bar
  // ------------------------------
  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          caseData.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(caseData.coverImage, fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------
  // Crime Report Section
  // ------------------------------
  Widget _buildCrimeReport() {
    return _section(
      title: 'Crime Report',
      child: Text(
        caseData.description,
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[800]),
      ),
    );
  }

  // ------------------------------
  // Suspects Section
  // ------------------------------
  Widget _buildSuspects(BuildContext context) {
    return _section(
      title: 'Suspects',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: caseData.suspects.map((suspect) {
          return GestureDetector(
            onTap: () {
              // Navigate to suspect profile
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuspectProfilePage(
                    name: suspect,
                    role: 'Unknown', // Could extend model to include role/motive
                    motive: 'Unknown',
                    description: 'Investigation notes not available.',
                    icon: Icons.person,
                  ),
                ),
              );
            },
            child: Chip(
              label: Text(
                suspect,
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              backgroundColor: Colors.red.shade50,
            ),
          );
        }).toList(),
      ),
    );
  }

  // ------------------------------
  // Evidence Trail Section
  // ------------------------------
  Widget _buildEvidenceTrail(BuildContext context) {
    final evidenceList = caseData.evidence;

    return _section(
      title: 'Evidence Trail',
      child: Column(
        children: List.generate(evidenceList.length, (index) {
          final item = evidenceList[index];
          return TimelineTile(
            isFirst: index == 0,
            isLast: index == evidenceList.length - 1,
            indicatorStyle: IndicatorStyle(
              width: 40,
              color: Colors.black,
              iconStyle: IconStyle(iconData: item.icon, color: Colors.white),
            ),
            beforeLineStyle: const LineStyle(color: Colors.black, thickness: 3),
            afterLineStyle: const LineStyle(color: Colors.black, thickness: 3),
            endChild: _buildEvidenceCard(context, item),
          );
        }),
      ),
    );
  }

  Widget _buildEvidenceCard(BuildContext context, EvidenceItem item) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          // Open EvidenceViewerPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EvidenceViewerPage(
                title: item.title,
                description: item.description,
                example: 'Example or code snippet can go here', // Extend model if needed
              ),
            ),
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 6),
                Text(
                  item.title,
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------
  // Verdict Section
  // ------------------------------
  Widget _buildVerdict() {
    return _section(
      title: 'Verdict',
      child: Text(
        caseData.verdict,
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[800]),
      ),
    );
  }

  // ------------------------------
  // Section Wrapper
  // ------------------------------
  Widget _section({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        child,
      ]),
    );
  }
}
