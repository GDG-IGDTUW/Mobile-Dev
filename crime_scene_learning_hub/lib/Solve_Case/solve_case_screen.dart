import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:crime_scene_learning_hub/question_model.dart';

class ExamScreen extends StatefulWidget {
  final List<Question> questions;

  const ExamScreen({super.key, required this.questions});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int currentIndex = 0;
  int score = 0;

  Set<int> selectedOptions = {};
  List<int?> userOrder = [];

  bool answered = false;
  bool isCorrect = false;

  Timer? _timer;
  int timeLeft = 30;

  @override
  void initState() {
    super.initState();
    _setupQuestion();
  }

  void _setupQuestion() {
    _timer?.cancel();
    timeLeft = 30;
    answered = false;
    isCorrect = false;
    selectedOptions.clear();

    final q = widget.questions[currentIndex];
    if (q.type == 'order') {
      userOrder = List<int?>.filled(q.options.length, null);
    } else {
      userOrder = [];
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        timer.cancel();
        _goNext();
      } else {
        setState(() => timeLeft--);
      }
    });
  }

  void _checkAnswer(dynamic selected, dynamic correct) {
    bool result = false;

    if (selected is int && correct is int) {
      result = selected == correct;
    } else if (selected is Set<int> && correct is List) {
      result = setEquals(selected, correct.cast<int>().toSet());
    } else if (selected is List<int> && correct is List) {
      result = listEquals(selected, correct.cast<int>());
    }

    setState(() {
      answered = true;
      isCorrect = result;
      if (result) score++;
    });
  }

  void _goNext() {
    if (currentIndex == widget.questions.length - 1) {
      _timer?.cancel();
      _showResult();
      return;
    }

    setState(() => currentIndex++);
    _setupQuestion();
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Exam Finished'),
        content: Text('Score: $score / ${widget.questions.length}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentIndex + 1}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text('⏱ $timeLeft')),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            /// MAIN QUESTION AREA
            Expanded(child: _buildQuestionUI(question)),

            if (answered)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  isCorrect ? 'Correct ✅' : 'Wrong ❌',
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: answered ? _goNext : null,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  // ================= QUESTION UI =================

  Widget _buildQuestionUI(Question q) {
    switch (q.type) {
      case 'single-select':
        return _buildSingleSelect(q);
      case 'multi-select':
        return _buildMultiSelect(q);
      case 'order':
        return _buildOrderQuestion(q);
      default:
        return const Text('Unknown question type');
    }
  }

  Widget _buildSingleSelect(Question q) {
    return ListView.builder(
      itemCount: q.options.length,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(q.options[index]),
            onTap: answered ? null : () => _checkAnswer(index, q.correctAnswer),
          ),
        );
      },
    );
  }

  Widget _buildMultiSelect(Question q) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: q.options.length,
            itemBuilder: (_, index) {
              return CheckboxListTile(
                value: selectedOptions.contains(index),
                title: Text(q.options[index]),
                onChanged: answered
                    ? null
                    : (val) {
                        setState(() {
                          val == true
                              ? selectedOptions.add(index)
                              : selectedOptions.remove(index);
                        });
                      },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: answered
              ? null
              : () => _checkAnswer(selectedOptions, q.correctAnswer),
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildOrderQuestion(Question q) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select correct order',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: q.options.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DropdownButtonFormField<int>(
                    isExpanded: true,
                    value: userOrder[i],
                    decoration: InputDecoration(
                      labelText: 'Position ${i + 1}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: List.generate(
                      q.options.length,
                      (index) => DropdownMenuItem(
                        value: index,
                        child: Text(
                          q.options[index],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    onChanged: answered
                        ? null
                        : (val) {
                            setState(() {
                              userOrder[i] = val;
                            });
                          },
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: answered || userOrder.contains(null)
                  ? null
                  : () => _checkAnswer(userOrder.cast<int>(), q.correctAnswer),
              child: const Text('Submit Order'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
