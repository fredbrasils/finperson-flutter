import 'package:flutter/material.dart';
import 'dart:math';

class FinPersonLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinPersonLogoState();
}

class FinPersonLogoState extends State<FinPersonLogo>
    with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation = Tween(begin: 0.0, end: 2.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LogoPainter(_fraction));
  }
}

class LogoPainter extends CustomPainter {
  Paint paintLine;
  double _fraction;
  double strokeWidth = 3;

  LogoPainter(this._fraction) {
    paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.green[100]
      ..strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double start = 0.0;
    double tail = 20.0;
    double miniHeight = (sin(35) * (width / 2) / sin(55));

    print('paint $_fraction');
    double miniLineFraction, lineFraction, shadowFraction;

    if (_fraction < .5) {
      miniLineFraction = _fraction / .5;
      lineFraction = 0.0;
      shadowFraction = 0.0;
    } else if (_fraction < 1.0) {
      miniLineFraction = 1.0;
      lineFraction = (_fraction - .5) / .5;
      shadowFraction = 0.0;
    } else {
      miniLineFraction = 1.0;
      lineFraction = 1.0;
      shadowFraction = (_fraction - 1) / 1;
    }

    // mini top line
    var topMiniLeft = Offset(
        width - 5 + (5 * miniLineFraction), tail - tail * miniLineFraction);
    var topMiniRight = Offset(width - 5, tail);
    canvas.drawLine(topMiniRight, topMiniLeft, paintLine);

    // var shadowMiniTop = Path()
    //   ..moveTo(width - ((width / 2) * shadowFraction),
    //       tail / 2 - ((tail / 2) * shadowFraction) - strokeWidth)
    //   ..lineTo(width, -strokeWidth)
    //   ..lineTo(width - 5, tail);

    var shadowMiniTop = Path()
      ..moveTo(width / 2, -strokeWidth)
      ..lineTo(width / 2 + (width / 2 * shadowFraction), -strokeWidth)
      ..lineTo(
          width / 2 + (width / 2 * shadowFraction) - 5, tail * shadowFraction);

    if (lineFraction == 1) {
      canvas.drawShadow(shadowMiniTop, Colors.green[50], 1, true);
    }

    // top line
    var topRight = Offset((width - start), start);
    var topLeft =
        Offset(width - (width * lineFraction), height * 0.35 * lineFraction);

    if (_fraction >= .5) {
      canvas.drawLine(topLeft, topRight, paintLine);
    }

    // var shadowTop = Path()
    //   ..moveTo(
    //       width / 2, miniHeight - miniHeight * shadowFraction - strokeWidth)
    //   ..lineTo(-strokeWidth * 2, height * 0.35)
    //   ..lineTo(width, start - strokeWidth);

    var shadowTop = Path()
      ..moveTo(width / 2, -strokeWidth)
      ..lineTo(width / 2 - (width / 2 * shadowFraction) - strokeWidth * 2,
          height * 0.35 * shadowFraction)
      ..lineTo(width / 2 + width / 2 * shadowFraction, -strokeWidth);

    if (lineFraction == 1) {
      canvas.drawShadow(shadowTop, Colors.green[50], 1, true);
    }

    // mini bottom line
    var bottomMiniLeft = Offset(5.0, height - tail);
    var bottomMiniRight = Offset(5.0 - (5.0 * miniLineFraction),
        height - tail + tail * miniLineFraction);
    canvas.drawLine(bottomMiniLeft, bottomMiniRight, paintLine);

    // var shadowMiniBottom = Path()
    //   ..moveTo(width / 2 * shadowFraction,
    //       (height - tail / 2) + (tail / 2 * shadowFraction))
    //   ..lineTo(5.0, height - tail - strokeWidth)
    //   ..lineTo(start, height);

    var shadowMiniBottom = Path()
      ..moveTo(width / 2, height)
      ..lineTo(width / 2 - (width / 2 * shadowFraction) + 5.0,
          height - (tail + strokeWidth) * shadowFraction)
      ..lineTo(width / 2 - (width / 2 * shadowFraction), height);

    if (lineFraction == 1) {
      canvas.drawShadow(shadowMiniBottom, Colors.green[50], 1, true);
    }
    // bottom line
    var bottomLeft = Offset(start, height);
    var bottomRight =
        Offset(width * lineFraction, height - height * 0.35 * lineFraction);

    if (_fraction >= .5) {
      canvas.drawLine(bottomLeft, bottomRight, paintLine);
    }

    // var shadowBottom = Path()
    //   ..moveTo(width / 2, (height - miniHeight) + miniHeight * shadowFraction)
    //   ..lineTo(start, height)
    //   ..lineTo(width + strokeWidth * 2, height - height * 0.35 - strokeWidth);

    var shadowBottom = Path()
      ..moveTo(width / 2, height)
      ..lineTo(width / 2 - (width / 2 * shadowFraction), height)
      ..lineTo(width / 2 + (width / 2 * shadowFraction) + strokeWidth * 2,
          height - (height * 0.35 + strokeWidth) * shadowFraction);

    if (lineFraction == 1) {
      canvas.drawShadow(shadowBottom, Colors.green[50], 1, true);
    }

    // middle line
    double middleY = height * 0.35;
    double middleX = (width / 2);

    var middleLeft = Offset(middleX - middleX * lineFraction,
        (middleY + middleY / 2) - (middleY / 2) * lineFraction);

    var middleRight = Offset(middleX + (middleX * lineFraction),
        (height / 2) + (middleY / 2 - strokeWidth) * lineFraction);

    if (_fraction >= .5) {
      canvas.drawLine(middleLeft, middleRight, paintLine);
    }

    // vertical line
    double verticalX = (width / 2);
    double verticalY = (height / 2);
    if (_fraction >= .5) {
      canvas.drawLine(Offset(verticalX, verticalY - verticalY * lineFraction),
          Offset(verticalX, verticalY + verticalY * lineFraction), paintLine);
    }
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

    var paintGreen = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square
      // ..color = Colors.green[700];
      ..color = Color.fromRGBO(56, 142, 60, shadowFraction);

    var paintRed = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square
      // ..color = Colors.red[700];
      ..color = Color.fromRGBO(211, 47, 47, shadowFraction);

    // top fill
    double topXCenter = (width / 2) - strokeWidth;
    double topXLeft = (width / 4) + strokeWidth * 2;
    double topYLeft = height * 0.35;
    double middle = topYLeft + (height / 2 - topYLeft) / 2;

    var pathTopFill = Path()
      ..moveTo(topXCenter, topYLeft)
      ..lineTo(topXCenter, topYLeft)
      ..lineTo(topXCenter, height / 2 - strokeWidth)
      ..lineTo(topXLeft, middle);

    if (lineFraction == 1) {
      canvas.drawPath(pathTopFill, paintGreen);
    }

    // bottom fill
    double y = height / 2 + ((height - (height * 0.35) - (height / 2)) / 2);
    double xy = (width / 2) + strokeWidth * 4;

    var pathBottomFill = Path()
      ..moveTo((width / 2) + strokeWidth, height - miniHeight)
      ..lineTo(width - (strokeWidth * 3), height - (height * 0.35))
      ..lineTo(xy, y + strokeWidth * 2);

    if (lineFraction == 1) {
      canvas.drawPath(pathBottomFill, paintRed);
    }
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(LogoPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
