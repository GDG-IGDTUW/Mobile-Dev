import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaseArchiveFiltersPage extends StatefulWidget {
  const CaseArchiveFiltersPage({super.key});

  @override
  State<CaseArchiveFiltersPage> createState() =>
      _CaseArchiveFiltersPageState();
}

class _CaseArchiveFiltersPageState extends State<CaseArchiveFiltersPage> {
  final Map<String, bool> filters = {
    'Operating Systems': false,
    'Databases': false,
    'Networking': false,
    'AI / ML': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter Case Files',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...filters.keys.map((key) {
              return CheckboxListTile(
                title: Text(
                  key,
                  style: GoogleFonts.poppins(),
                ),
                value: filters[key],
                onChanged: (value) {
                  setState(() {
                    filters[key] = value!;
                  });
                },
              );
            }).toList(),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, filters);
              },
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
