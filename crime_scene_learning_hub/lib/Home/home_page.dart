import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crime_scene_learning_hub/theme/app_theme.dart';
import 'package:crime_scene_learning_hub/Cases/all_cases.dart';
import 'package:crime_scene_learning_hub/Solve_Case/solve_case_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<String> allFacts = [
    "The first computer bug was an actual moth.",
    "Recursion always needs a base case to stop.",
    "Compilers catch errors; logic bugs survive.",
    "Pointers can point… or ruin your day.",
    "Deadlock requires all 4 Coffman conditions.",
    "Race conditions depend on timing, not logic.",
    "Starvation means waiting forever without deadlock.",
    "Priority inversion breaks scheduling fairness.",
    "Linux has over 30 million lines of code.",
    "Whitespace matters in Python.",
    "Null pointer errors exist across languages.",
    "Multithreading ≠ parallelism always.",
    "Threads share memory; processes don’t.",
    "Context switching is expensive.",
    "Databases also suffer from deadlocks.",
    "Most bugs hide in edge cases.",
  ];

  List<String> _getRandomFacts() {
    final shuffled = List<String>.from(allFacts)..shuffle(Random());
    return shuffled.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final randomFacts = _getRandomFacts();
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------- JINGLE -----------------
          Center(
            child: Text(
              "Where bugs leave clues,\nthreads become suspects,\nand you crack the case.",
              textAlign: TextAlign.center, // center text
              style: theme.textTheme.headlineSmall?.copyWith(
                fontStyle: FontStyle.italic, // italics
                fontSize: 20, // slightly smaller than displaySmall
              ),
            ),
          ),
          const SizedBox(height: 10),

// ----------------- IMAGE -----------------
          Center(
            child: Image.asset(
              'images/opening_home_page.png',
              width: screenWidth * 0.9, // responsive width
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),

// ----------------- TEXT AFTER IMAGE -----------------
          Center(
            child: Text(
              "Learn Computer Science by investigating it.",
              textAlign: TextAlign.center, // center text
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 16, // slightly smaller if needed
              ),
            ),
          ),
          const SizedBox(height: 32),

          // ----------------- VERTICAL ACTION CARDS -----------------
          _VerticalActionCard(
            title: "Explore Cases",
            subtitle: "Investigate CS problems using evidence",
            icon: Icons.search,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AllCasesPage(),
                  ));
            },
          ),
          const SizedBox(height: 16),
          _VerticalActionCard(
            title: "Take a Test",
            subtitle: "Solve timed exam-style questions",
            icon: Icons.timer,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SolveCaseHome(),
                  ));
            },
          ),

          const SizedBox(height: 40),

          // ----------------- TECH EVIDENCE -----------------
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: AppTheme.primaryColor),
              const SizedBox(width: 8),
              Text(
                "Tech Evidence",
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: randomFacts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 240,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: AppTheme.cardGradient,
                    borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Text(
                    randomFacts[index],
                    style: theme.textTheme.bodyMedium,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- VERTICAL ACTION CARD WIDGET -----------------
class _VerticalActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _VerticalActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.borderRadius),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 6),
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primaryColor, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(subtitle, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,
                size: 16, color: AppTheme.secondaryTextColor),
          ],
        ),
      ),
    );
  }
}
