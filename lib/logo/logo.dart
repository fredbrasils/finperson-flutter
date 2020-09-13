import 'package:flutter/material.dart';
import 'dart:math';

class LogoPainter extends CustomPainter {
/*
          // ---------------------> X
          // |
          // |  (10,60)   (20,60)
          // |
          // |
          // |
          // |  (10,100)   (20,100)
          // |
          // V
          // Y
                         X  Y   X+10 Y+50
          Rect.fromLTWH(10, 50, 10, 50)
*/

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    var paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..color = Colors.green[100]
      ..strokeWidth = 3
      ..isAntiAlias = true;

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.green[700]
      ..strokeWidth = 4
      ..isAntiAlias = true;

    var path = Path();

    double espace = 12.0;
    double line = 6.0;

    // top arc
    double topLeftX = espace;
    double topLeftY = (height * 0.15);
    double topHandleX = (width / 2);
    double topHandleY = 0.0;
    double topRightX = width - espace;
    double topRightY = (height * 0.15);

    path.moveTo(topLeftX, topLeftY);
    path.quadraticBezierTo(topHandleX, topHandleY, topRightX, topRightY);
    canvas.drawPath(path, paint);

    // mini top line
    canvas.drawLine(
        Offset(width - espace, (height * 0.15) + espace),
        Offset(width - espace - line, (height * 0.15) + espace + line),
        paintLine);

    // bottom arc
    double bottomLeftX = espace;
    double bottomLeftY = height - (height * 0.15);
    double bottomHandleX = (width / 2);
    double bottomHandleY = height;
    double bottomRightX = width - espace;
    double bottomRightY = height - (height * 0.15);

    path.moveTo(bottomLeftX, bottomLeftY);
    path.quadraticBezierTo(
        bottomHandleX, bottomHandleY, bottomRightX, bottomRightY);
    canvas.drawPath(path, paint);

    // mini bottom line
    canvas.drawLine(
        Offset(espace, height - (height * 0.15) - (line * 2)),
        Offset(espace + line, height - (height * 0.15) - (line * 3)),
        paintLine);

    // middle line
    canvas.drawLine(
        Offset(width / 2, 0.0), Offset(width / 2, height), paintLine);

    // middle arc
    double middleLeftX = espace;
    double middleLeftY = (height * 0.15) + espace;
    double middleHandleX = (width / 2) - (espace * 1);
    double middleHandleY = (height / 2) + (espace * 2);
    double middleRightX = width - espace;
    double middleRightY = height - (height * 0.15) - espace;

    path.moveTo(middleLeftX, middleLeftY);
    path.quadraticBezierTo(
        middleHandleX, middleHandleY, middleRightX, middleRightY);
    canvas.drawPath(path, paint);

    // bottom arc fill
    var pathFill = Path();

    var paintFill = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red[700]
      ..strokeWidth = 12;
    double espaceFill = 8;

    double bottomFillLeftX = (width / 2) + espaceFill;
    double bottomFillLeftY = height - (height * 0.15);
    double bottomFillHandleX = (width * 0.75);
    double bottomFillHandleY = height - (height * 0.15);
    double bottomFillRightX = width - (espace * 2) - espaceFill;
    double bottomFillRightY = height - (height * 0.15) - espaceFill;

    pathFill.moveTo(bottomFillLeftX, bottomFillLeftY);
    pathFill.quadraticBezierTo(bottomFillHandleX, bottomFillHandleY,
        bottomFillRightX, bottomFillRightY);
    canvas.drawPath(pathFill, paintFill);

    // top arc fill

    double espaceTopFill = 12;
    double topFillLeftX = (width / 2) - (espaceTopFill * 3.5);
    double topFillLeftY = (height / 2) - espaceTopFill;
    double topFillCenterX = (width / 2) - 3;
    double topFillCenterY = (height / 2) - espaceTopFill;
    double topFillRightX = (width / 2) - 3;
    double topFillRightY = (height / 2) + (espaceTopFill * 1.3);

    final rect = Rect.fromPoints(Offset(topFillCenterX, topFillCenterY),
        Offset(topFillLeftX + espaceTopFill, topFillLeftY + espaceTopFill));
    final startAngle = -pi / 2;
    final sweepAngle = pi;
    final useCenter = false;

    var pathTopFill = Path()
      ..moveTo(topFillLeftX, topFillLeftY)
      ..lineTo(topFillCenterX, topFillCenterY)
      ..lineTo(topFillRightX, topFillRightY)
      // ..arcTo(rect, startAngle, sweepAngle, useCenter)

      // ..lineTo(topFillLeftX, topFillLeftY)
      ..lineTo(topFillRightX, topFillRightY);

    var paintTopFill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red[700]
      ..strokeWidth = 3;

    // canvas.drawPath(pathTopFill, paintTopFill);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
