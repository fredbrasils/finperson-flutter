import 'dart:ui';

import 'package:Finperson/pages/main/main-page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class ArcText extends StatelessWidget {
  const ArcText({
    Key key,
    @required this.radius,
    @required this.text,
    @required this.textStyle,
    this.startAngle = 0,
  }) : super(key: key);

  final double radius;
  final String text;
  final double startAngle;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _Painter(
          radius,
          text,
          textStyle,
          initialAngle: startAngle,
        ),
      );
}

class _Painter extends CustomPainter {
  _Painter(this.radius, this.text, this.textStyle, {this.initialAngle = 0});

  final num radius;
  final String text;
  final double initialAngle;
  final TextStyle textStyle;

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);
  final icon = Icons.add;

  Paint paintLine = Paint()
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round
    ..color = Colors.green[900]
    ..strokeWidth = 3;

  Paint pp = Paint()
    ..color = Colors.blue
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  Paint pp1 = Paint()
    ..color = Colors.red
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  Paint pp2 = Paint()
    ..color = Colors.amber
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double start = 0.0;

    Offset p0 = Offset(start, height);
    Offset cp0 = Offset(start, height / 2);
    Offset cp1 = Offset(width, height / 2);
    Offset p1 = Offset(width, height);
    var t = 0.5;

    // Ax = ((1 - t) * p0x) + (t * cp0x);
    // Ay = ((1 - t) * p0y) + (t * cp0y);
    Offset A = Offset(
        ((1 - t) * p0.dx) + (t * cp0.dx), ((1 - t) * p0.dy) + (t * cp0.dy));

    // Bx = ((1 - t) * cp0x) + (t * cp1x);
    // By = ((1 - t) * cp0y) + (t * cp1y);
    Offset B = Offset(
        ((1 - t) * cp0.dx) + (t * cp1.dx), ((1 - t) * cp0.dy) + (t * cp1.dy));

    // Cx = ((1 - t) * cp1x) + (t * p1x);
    // Cy = ((1 - t) * cp1y) + (t * p1y);
    Offset C = Offset(
        ((1 - t) * cp1.dx) + (t * p1.dx), ((1 - t) * cp1.dy) + (t * p1.dy));

    // Dx = ((1 - t) * Ax) + (t * Bx);
    // Dy = ((1 - t) * Ay) + (t * By);
    Offset D =
        Offset(((1 - t) * A.dx) + (t * B.dx), ((1 - t) * A.dy) + (t * B.dy));

    // Ex = ((1 - t) * Bx) + (t * Cx);
    // Ey = ((1 - t) * By) + (t * Cy);
    Offset E =
        Offset(((1 - t) * B.dx) + (t * C.dx), ((1 - t) * B.dy) + (t * C.dy));

    // Px = ((1 - t) * Dx) + (t * Ex);
    // Py = ((1 - t) * Dy) + (t * Ey);
    Offset P =
        Offset(((1 - t) * D.dx) + (t * E.dx), ((1 - t) * D.dy) + (t * E.dy));

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, height)
      ..quadraticBezierTo(width / 2, height - height / 4, width, height)
      ..lineTo(width, 0);

    canvas.drawPath(path, paintLine);

    // canvas.drawPoints(PointMode.points, [A, B, C], pp);
    // canvas.drawPoints(PointMode.points, [D, E], pp1);
    // canvas.drawPoints(PointMode.points, [P], pp2);

    // Offset L = Offset(P.dx, P.dy + height / 4);
    // canvas.drawLine(P, L, paintLine);

    _textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        backgroundColor: Colors.white70,
        fontSize: 50.0,
        fontFamily: icon.fontFamily,
        color: Colors.green[900],
        shadows: [
          Shadow(
            blurRadius: 10.0,
            // color: Colors.blue,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          print('test');
        },
    );

    _textPainter.layout(
        // minWidth: 0,
        // maxWidth: double.maxFinite,
        );

    Offset L = Offset(P.dx - 25, P.dy - 25);
    _textPainter.paint(canvas, L);

    // canvas.translate(size.width / 2, size.height / 2 - radius);

    // if (initialAngle != 0) {
    //   final d = 2 * radius * math.sin(initialAngle / 2);
    //   final rotationAngle = _calculateRotationAngle(0, initialAngle);
    //   canvas.rotate(rotationAngle);
    //   canvas.translate(d, 0);
    // }

    // double angle = initialAngle;
    // for (int i = 0; i < text.length; i++) {
    //   angle = _drawLetter(canvas, text[i], angle);
    // }
  }

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    // _textPainter.text = TextSpan(text: letter, style: textStyle);
    _textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            fontSize: 40.0, fontFamily: icon.fontFamily, color: Colors.black));

    _textPainter.layout(
        // minWidth: 0,
        // maxWidth: double.maxFinite,
        );

    final double d = _textPainter.width;
    final double alpha = 2 * math.asin(d / (2 * radius));

    final newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(double prevAngle, double alpha) =>
      (alpha + prevAngle) / 2;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// class MenuPainter extends CustomPainter {
//   Paint paintLine;
//   double _fraction;
//   double strokeWidth = 3;

//   MenuPainter() {
//     paintLine = Paint()
//       ..style = PaintingStyle.fill
//       ..strokeCap = StrokeCap.round
//       ..color = Colors.green[900]
//       ..strokeWidth = strokeWidth;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     double width = size.width;
//     double height = size.height;

//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo(0, height)
//       ..quadraticBezierTo(width / 2, height / 2, width, height)
//       ..lineTo(width, 0);

//     canvas.drawPath(path, paintLine);

//     canvas.save();
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(MenuPainter oldDelegate) {
//     return true;
//   }
// }