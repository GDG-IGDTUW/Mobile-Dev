import 'package:flutter/material.dart';
import '../models/character.dart';
import 'character_painter.dart';

class AnimatedCharacter extends StatefulWidget {
  final Character character;

  const AnimatedCharacter({super.key, required this.character});

  @override
  State<AnimatedCharacter> createState() => _AnimatedCharacterState();
}

class _AnimatedCharacterState extends State<AnimatedCharacter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  double get floatStrength {
    switch (widget.character.mood) {
      case MoodLevel.low:
        return 2;
      case MoodLevel.neutral:
        return 4;
      case MoodLevel.high:
        return 7;
    }
  }

  double get tilt {
    switch (widget.character.mood) {
      case MoodLevel.low:
        return -0.08;
      case MoodLevel.neutral:
        return 0;
      case MoodLevel.high:
        return 0.06;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -floatStrength * _controller.value),
          child: Transform.rotate(
            angle: tilt,
            child: Opacity(opacity: 0.85, child: child),
          ),
        );
      },
      child: CharacterAvatar(type: widget.character.type, size: 120),
    );
  }
}
