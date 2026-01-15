import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:crime_scene_learning_hub/Utils/case_tile.dart';
import 'package:crime_scene_learning_hub/Solve_Case/solve_case_screen.dart';
import 'package:crime_scene_learning_hub/question_model.dart';

class SolveCaseHome extends StatelessWidget {
  const SolveCaseHome({super.key});

  Future<List<Question>> _loadQuestions(String path) async {
    final data = await rootBundle.loadString(path);
    final jsonMap = json.decode(data);
    return QuestionList.fromJson(jsonMap).questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Solve the Case',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ExamTile(
              name: 'Deadlock in Multithreading',
              time: '30 sec / question',
              questionCount: 5,
              onStart: () async {
                final questions = await _loadQuestions(
                    'assets/deadlock_multi_case.json');
                Get.to(() => ExamScreen(questions: questions));
              },
            ),

            ExamTile(
              name: 'Race Condition',
              time: '30 sec / question',
              questionCount: 5,
              onStart: () async {
                final questions =
                    await _loadQuestions('assets/race_condition_case.json');
                Get.to(() => ExamScreen(questions: questions));
              },
            ),
            ExamTile(
              name: 'Deadlock in Databases',
              time: '30 sec / question',
              questionCount: 5,
              onStart: () async {
                final questions =
                    await _loadQuestions('assets/deadlock_db_case.json');
                Get.to(() => ExamScreen(questions: questions));
              },
            ),
            ExamTile(
              name: 'Starvation in Scheduling',
              time: '30 sec / question',
              questionCount: 5,
              onStart: () async {
                final questions =
                    await _loadQuestions('assets/starvation_case.json');
                Get.to(() => ExamScreen(questions: questions));
              },
            ),
          ],
        ),
      ),
    );
  }
}
