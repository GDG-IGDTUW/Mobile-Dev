import 'package:flutter/material.dart';
import '../models/character.dart';
import '../widgets/animated_character.dart';
import 'summary.dart';

class StoryScreen extends StatefulWidget {
  final Character character;

  const StoryScreen({super.key, required this.character});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int step = 0;
  final responses = List.generate(4, (_) => '');

  final prompts = const [
    {
      'title': 'Act I — The Beginning',
      'text': 'How did your day begin?',
      'icon': Icons.nights_stay,
    },
    {
      'title': 'Act II — The Shift',
      'text': 'Did something change how you felt?',
      'icon': Icons.sync_alt,
    },
    {
      'title': 'Act III — The Weight',
      'text': 'What stayed with you the longest?',
      'icon': Icons.psychology,
    },
    {
      'title': 'Act IV — The Carry',
      'text': 'What are you taking into tomorrow?',
      'icon': Icons.auto_stories,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = prompts[step];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.05, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: Stack(
          key: ValueKey(step),
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),

                  Icon(
                    current['icon'] as IconData,
                    size: 36,
                    color: const Color(0xFFD4AF37),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.character.name.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFFD4AF37),
                      letterSpacing: 1.4,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    current['title'] as String,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    current['text'] as String,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 24),

                  Expanded(
                    child: TextField(
                      autofocus: true,
                      maxLines: null,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFFEDEDED),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Let the moment unfold...',
                        hintStyle: TextStyle(color: Color(0xFFA1A1AA)),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        responses[step] = value;
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        if (step < prompts.length - 1) {
                          setState(() => step++);
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SummaryScreen(
                                character: widget.character.name,
                                responses: responses,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        step < prompts.length - 1 ? 'Next →' : 'Reveal Story',
                        style: const TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔥 Animated character overlay
            Positioned(
              bottom: 24,
              right: 16,
              child: IgnorePointer(
                ignoring: true,
                child: AnimatedCharacter(character: widget.character),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
