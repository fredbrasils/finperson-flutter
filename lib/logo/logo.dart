import 'package:flutter/material.dart';
import 'dart:math';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double strokeWidth = 3;

    var paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.green[100]
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    var paintGreen = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square
      ..color = Colors.green[700]
      ..isAntiAlias = true;

    var paintRed = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square
      ..color = Colors.red[700]
      ..isAntiAlias = true;

    // top line
    var topLeft = Offset(10.0, height * 0.35);
    var topRight = Offset(width - 10.0, 10.0);
    canvas.drawLine(topLeft, topRight, paintLine);

    var shadowTop = Path()
      ..moveTo(width / 2, 0)
      ..lineTo(10.0, height * 0.35)
      ..lineTo(width - 10.0, 10.0);

    canvas.drawShadow(shadowTop, Colors.green[50], 1, true);

    // mini top line
    var topMiniLeft = Offset(width - 10.0, 10.0);
    var topMiniRight = Offset(width - 5.0, 20.0);
    canvas.drawLine(topMiniLeft, topMiniRight, paintLine);

    var shadowMiniTop = Path()
      ..moveTo(width / 2, 0)
      ..lineTo(width - 10.0, 10.0)
      ..lineTo(width - 5.0, 20.0);

    canvas.drawShadow(shadowMiniTop, Colors.green[50], 1, true);

    // bottom line
    var bottomLeft = Offset(10.0, height - 10.0);
    var bottomRight = Offset(width - 10.0, height - height * 0.35);
    canvas.drawLine(bottomLeft, bottomRight, paintLine);

    var shadowBottom = Path()
      ..moveTo(width / 2, height)
      ..lineTo(10.0, height - 10.0)
      ..lineTo(width - 10.0, height - height * 0.35);

    canvas.drawShadow(shadowBottom, Colors.green[50], 1, true);

    // mini bottom line
    var bottomMiniLeft = Offset(5.0, height - 20.0);
    var bottomMiniRight = Offset(10.0, height - 10.0);
    canvas.drawLine(bottomMiniLeft, bottomMiniRight, paintLine);

    var shadowMiniBottom = Path()
      ..moveTo(width / 2, height)
      ..lineTo(5.0, height - 20.0)
      ..lineTo(10.0, height - 10.0);

    canvas.drawShadow(shadowMiniBottom, Colors.green[50], 1, true);

    // middle line
    var middleLeft = Offset(10.0, height * 0.35);
    var middleRight = Offset(width - 10.0, height - height * 0.35);
    canvas.drawLine(middleLeft, middleRight, paintLine);

    // vertical line
    canvas.drawLine(
        Offset(width / 2, 0.0), Offset(width / 2, height), paintLine);

    canvas.drawLine(topLeft, topRight, paintLine);

    // top fill
    double topXCenter = (width / 2) - 3.0;
    double topXLeft = 35.0;
    double topYLeft = height * 0.35;

    var pathTopFill = Path()
      ..moveTo(topXLeft, topYLeft + 5)
      ..lineTo(topXCenter, topYLeft)
      ..lineTo((width / 2) - 3, height / 2 - 5)
      ..lineTo(topXLeft, topYLeft + 5);
    canvas.drawPath(pathTopFill, paintGreen);

    // bottom fill

/*
     x         h       (width - 20) / 2
 -------- = -------- = ------------------
  sen 35     sen 90          sen 55
        
        55
        /|
     h / | x
      /  |
  35 ---- 90

      (width - 20) / 2
*/
    double x = (sin(35) * ((width / 2) - 10) / sin(55));
    double y = height / 2 + ((height - (height * 0.35) - (height / 2)) / 2);
    double xy = (width / 2) + strokeWidth + 5;

    var pathBottomFill = Path()
      ..moveTo((width / 2) + strokeWidth, height - x - (strokeWidth * 3))
      ..lineTo(width - 10 - (strokeWidth * 3), height - (height * 0.35))
      ..lineTo(xy, y);

    canvas.drawPath(pathBottomFill, paintRed);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
