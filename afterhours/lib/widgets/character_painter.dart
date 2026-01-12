import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterAvatar extends StatelessWidget {
  final CharacterType type;
  final double size;

  const CharacterAvatar({super.key, required this.type, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _CharacterPainter(type)),
    );
  }
}

class _CharacterPainter extends CustomPainter {
  final CharacterType type;

  _CharacterPainter(this.type);

  @override
  void paint(Canvas canvas, Size size) {
    final gold = Paint()
      ..color = const Color(0xFFD4AF37)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final soft = Paint()
      ..color = const Color(0xFF2A2A36)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final glow = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.08)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 45, glow);

    // Head
    canvas.drawCircle(Offset(center.dx, center.dy - 20), 18, soft);
    canvas.drawCircle(Offset(center.dx, center.dy - 20), 18, gold);

    // Body posture
    final path = Path();
    switch (type) {
      case CharacterType.thinker:
        path.moveTo(center.dx, center.dy);
        path.quadraticBezierTo(
          center.dx - 10,
          center.dy + 25,
          center.dx,
          center.dy + 40,
        );
        break;

      case CharacterType.dreamer:
        path.moveTo(center.dx, center.dy);
        path.quadraticBezierTo(
          center.dx + 15,
          center.dy + 25,
          center.dx,
          center.dy + 40,
        );
        break;

      case CharacterType.drifter:
        path.moveTo(center.dx, center.dy);
        path.lineTo(center.dx, center.dy + 40);
        break;

      case CharacterType.observer:
        path.moveTo(center.dx, center.dy);
        path.quadraticBezierTo(
          center.dx,
          center.dy + 20,
          center.dx - 15,
          center.dy + 40,
        );
        break;
    }

    canvas.drawPath(path, gold);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
