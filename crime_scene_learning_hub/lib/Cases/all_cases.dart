import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'case_details.dart';
import 'case_archive_filter.dart';
import 'package:crime_scene_learning_hub/model/crime_case_model.dart';

class AllCasesPage extends StatefulWidget {
  const AllCasesPage({super.key});

  @override
  State<AllCasesPage> createState() => _AllCasesPageState();
}

class _AllCasesPageState extends State<AllCasesPage> {
  List<CrimeCase> allCases = [];
  List<CrimeCase> displayedCases = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCases();
  }

  Future<void> _loadCases() async {
    setState(() => isLoading = true);

    final String jsonString = await rootBundle.loadString('assets/cases.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    allCases = jsonData.map((e) => CrimeCase.fromJson(e)).toList();
    displayedCases = List.from(allCases);

    setState(() => isLoading = false);
  }

  void _applyFilters(Map<String, bool> selectedFilters) {
    final activeFilters = selectedFilters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    setState(() {
      if (activeFilters.isEmpty) {
        displayedCases = List.from(allCases);
      } else {
        displayedCases = allCases.where((c) {
          return activeFilters.any(
            (filter) =>
                c.category.toLowerCase() == filter.toLowerCase(),
          );
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crime Cases',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () async {
              final selectedFilters = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CaseArchiveFiltersPage(),
                ),
              );

              if (selectedFilters != null) {
                _applyFilters(selectedFilters);
              }
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : displayedCases.isEmpty
              ? Center(
                  child: Text(
                    'No cases found for selected filters.',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: displayedCases.length,
                  itemBuilder: (context, index) {
                    final crimeCase = displayedCases[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CaseDetailsPage(caseData: crimeCase),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ─── HEADER STRIP (replaces image) ───
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    crimeCase.category,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ─── CONTENT ───
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    crimeCase.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    crimeCase.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tap to investigate',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.blueGrey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

