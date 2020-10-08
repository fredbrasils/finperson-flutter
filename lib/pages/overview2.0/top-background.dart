import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBackgroundPainter extends CustomPainter {
  Paint paintLine = Paint()
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round
        ..color = Colors.green[900]
      // ..strokeWidth = 3
      ;

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, height)
      ..quadraticBezierTo(width / 2, height - height / 4, width, height)
      ..lineTo(width, 0);

// gradient bar revenue
    // final colors = [Colors.green[900], Colors.green[800], Colors.green[700]];
    // final stops = [0.3, 0.7, 1.0];
    // final gradient = LinearGradient(
    //     colors: colors,
    //     stops: stops,
    //     begin: Alignment.topCenter,
    //     end: Alignment.bottomCenter);

    // paintLine.shader =
    //     gradient.createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawPath(path, paintLine);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(TopBackgroundPainter oldDelegate) {
    return true;
  }
}
