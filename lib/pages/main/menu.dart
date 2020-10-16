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

    Offset L = Offset(P.dx - 25, P.dy - 25);
    _textPainter.paint(canvas, L);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MenuOverview extends StatefulWidget {
  List<IconButton> menuList;

  MenuOverview({this.menuList});

  @override
  _MenuOverviewState createState() => _MenuOverviewState();
}

class _MenuOverviewState extends State<MenuOverview> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
