import "package:flutter/material.dart";

import 'dart:math';

class CustomCircleBorder extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  CustomCircleBorder(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    // final colors = [Colors.red[100], Colors.red[400], Colors.red[900]];
    // final stops = [0.0, 0.8, 1.0];

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    // final gradient = RadialGradient(
    //   center: Alignment.topRight,
    //   radius: 0.9,
    //   colors: colors,
    //   stops: stops,
    // );

    // complete.shader =
    //     gradient.createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);

    //drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint)
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
