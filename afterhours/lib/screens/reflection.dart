import 'package:flutter/material.dart';
import 'summary.dart';
import '../widgets/prompt_card.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({super.key});

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  final controllers = List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tonight’s Reflection')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PromptCard(
              title: 'Act 1 — The Setup',
              hint: 'What was the main thing on your mind today?',
              controller: controllers[0],
            ),
            PromptCard(
              title: 'Act 2 — The Moment',
              hint: 'What moment changed your mood?',
              controller: controllers[1],
            ),
            PromptCard(
              title: 'Act 3 — The Thought',
              hint: 'What did you keep thinking about?',
              controller: controllers[2],
            ),
            PromptCard(
              title: 'Act 4 — The Takeaway',
              hint: 'One thing you learned or felt today',
              controller: controllers[3],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SummaryScreen(
                      character: 'YourCharacterValue',
                      responses: controllers.map((c) => c.text).toList(),
                    ),
                  ),
                );
              },
              child: const Text('View Summary'),
            ),
          ],
        ),
      ),
    );
  }
}
