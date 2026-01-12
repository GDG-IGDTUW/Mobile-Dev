import 'package:flutter/material.dart';
import '../models/character.dart';
import '../widgets/animated_character.dart';

class SummaryScreen extends StatefulWidget {
  final String character;
  final List<String> responses;

  const SummaryScreen({
    super.key,
    required this.character,
    required this.responses,
  });

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen>
    with TickerProviderStateMixin {
  late final AnimationController _screenController;

  @override
  void initState() {
    super.initState();
    _screenController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _screenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scenes = [
      'It began with',
      'Then something shifted',
      'What stayed was',
      'And tonight carries',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Your Story')),
      body: FadeTransition(
        opacity: _screenController,
        child: SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(0, 0.05),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _screenController,
                  curve: Curves.easeOut,
                ),
              ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.character.toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFFD4AF37),
                        letterSpacing: 1.6,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Tonight’s Story',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD4AF37),
                      ),
                    ),

                    const SizedBox(height: 32),

                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 420,
                          child: ListView.builder(
                            itemCount: widget.responses.length,
                            itemBuilder: (context, index) {
                              final text = widget.responses[index].trim();
                              if (text.isEmpty) {
                                return const SizedBox.shrink();
                              }

                              return _AnimatedScene(
                                delay: index * 250,
                                label: scenes[index],
                                text: text,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            color: Color(0xFFD4AF37),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🎭 Animated character presence (non-interactive)
              Positioned(
                bottom: 120,
                right: 40,
                child: IgnorePointer(
                  ignoring: true,
                  child: AnimatedCharacter(
                    character: const Character(
                      name: '',
                      description: '',
                      type: CharacterType.observer,
                      mood: MoodLevel.neutral,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedScene extends StatefulWidget {
  final int delay;
  final String label;
  final String text;

  const _AnimatedScene({
    required this.delay,
    required this.label,
    required this.text,
  });

  @override
  State<_AnimatedScene> createState() => _AnimatedSceneState();
}

class _AnimatedSceneState extends State<_AnimatedScene>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  color: Color(0xFFA1A1AA),
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 19,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFEDEDED),
                ),
              ),
              const SizedBox(height: 16),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 400),
                builder: (context, value, child) {
                  return Container(
                    width: 60 * value,
                    height: 1,
                    color: const Color(0xFFD4AF37),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
