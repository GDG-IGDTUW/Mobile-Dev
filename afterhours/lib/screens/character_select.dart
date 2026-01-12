import 'package:flutter/material.dart';
import '../models/character.dart';
import '../widgets/character_painter.dart';
import 'mood_arc.dart';

class CharacterSelectScreen extends StatelessWidget {
  const CharacterSelectScreen({super.key});

  static final List<Character> characters = [
    Character(
      name: 'The Thinker',
      description: 'Always inside your head',
      type: CharacterType.thinker,
    ),
    Character(
      name: 'The Dreamer',
      description: 'Drifting through moments',
      type: CharacterType.dreamer,
    ),
    Character(
      name: 'The Drifter',
      description: 'Just moving through the day',
      type: CharacterType.drifter,
    ),
    Character(
      name: 'The Observer',
      description: 'Watching it all unfold',
      type: CharacterType.observer,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Character')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tonight, you are…',
              style: TextStyle(fontSize: 18, color: Color(0xFFA1A1AA)),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: GridView.builder(
                itemCount: characters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final character = characters[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MoodArcScreen(character: character),
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CharacterAvatar(type: character.type, size: 110),
                            const SizedBox(height: 16),
                            Text(
                              character.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEDEDED),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              character.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFA1A1AA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
