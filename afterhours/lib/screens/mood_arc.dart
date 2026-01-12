import 'package:flutter/material.dart';
import '../models/character.dart';
import 'story.dart';

class MoodArcScreen extends StatefulWidget {
  final Character character;

  const MoodArcScreen({super.key, required this.character});

  @override
  State<MoodArcScreen> createState() => _MoodArcScreenState();
}

class _MoodArcScreenState extends State<MoodArcScreen> {
  MoodLevel? selectedMood;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Day’s Mood')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'How did your day feel overall?',
              style: TextStyle(color: Color(0xFFA1A1AA)),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MoodButton(
                  emoji: '😞',
                  label: 'Heavy',
                  onTap: () => setState(() => selectedMood = MoodLevel.low),
                ),
                _MoodButton(
                  emoji: '😐',
                  label: 'Steady',
                  onTap: () => setState(() => selectedMood = MoodLevel.neutral),
                ),
                _MoodButton(
                  emoji: '🙂',
                  label: 'Light',
                  onTap: () => setState(() => selectedMood = MoodLevel.high),
                ),
              ],
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: selectedMood == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StoryScreen(
                            character: widget.character.copyWith(
                              mood: selectedMood,
                            ),
                          ),
                        ),
                      );
                    },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoodButton extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;

  const _MoodButton({
    required this.emoji,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Color(0xFFA1A1AA))),
        ],
      ),
    );
  }
}
