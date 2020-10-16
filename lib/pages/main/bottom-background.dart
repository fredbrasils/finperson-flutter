import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBackgroundPainter extends CustomPainter {
  Paint paintLine = Paint()
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round
    ..color = Colors.green[900];

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path()
      ..moveTo(0, height)
      ..lineTo(0, height / 2)
      ..quadraticBezierTo(width / 2, height - height / 4, width, height / 2)
      ..lineTo(width, height);

    canvas.drawPath(path, paintLine);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(BottomBackgroundPainter oldDelegate) {
    return true;
  }
}
