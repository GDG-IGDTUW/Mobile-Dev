import 'package:flutter/material.dart';

class CrimeCase {
  final String id;
  final String title;
  final String coverImage;
  final List<String> suspects;
  final String description;
  final String verdict;
  final List<EvidenceItem> evidence;
  final String category; 

  CrimeCase({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.suspects,
    required this.description,
    required this.verdict,
    required this.evidence,
    required this.category, 
  });

  factory CrimeCase.fromJson(Map<String, dynamic> json) {
    List<EvidenceItem> evidenceList = [];
    if (json['evidence'] != null) {
      evidenceList = List<Map<String, dynamic>>.from(json['evidence'])
          .map((e) => EvidenceItem.fromJson(e))
          .toList();
    }

    return CrimeCase(
      id: json['id'],
      title: json['title'],
      coverImage: json['coverImage'],
      suspects: List<String>.from(json['suspects'] ?? []),
      description: json['description'] ?? '',
      verdict: json['verdict'] ?? '',
      evidence: evidenceList,
      category: json['category'] ?? 'Uncategorized', // default value
    );
  }
}

class EvidenceItem {
  final String label;
  final String title;
  final String description;
  final IconData icon;

  EvidenceItem(this.label, this.title, this.description, this.icon);

  factory EvidenceItem.fromJson(Map<String, dynamic> json) {
    IconData iconData;
    switch (json['icon']) {
      case 'lock':
        iconData = Icons.lock;
        break;
      case 'sync_problem':
        iconData = Icons.sync_problem;
        break;
      case 'block':
        iconData = Icons.block;
        break;
      default:
        iconData = Icons.help_outline;
    }

    return EvidenceItem(
      json['label'],
      json['title'],
      json['description'],
      iconData,
    );
  }
}
