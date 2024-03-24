import 'package:flutter/material.dart';
import 'package:tests/models/draw_line.dart';

class SignatureClass extends CustomPainter {
  final List<DrawLine> lines;

  SignatureClass({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    for (final line in lines) {
      for (var i = 0; i < line.points.length - 1; i++) {
        final currentPoint = line.points[i];
        if (i > 0) {
          final previousPoint = line.points[i - 1];
          canvas.drawLine(previousPoint, currentPoint, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
