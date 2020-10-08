import "package:flutter/material.dart";

import 'dart:math';

class CircleChart extends CustomPainter {
  Color colorCircleInterne;
  Color colorCircleExterne;
  double percent;
  double width;

  CircleChart(
      {this.colorCircleInterne,
      this.colorCircleExterne,
      this.percent = 50,
      this.width = 5});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = new Paint()
      ..color = colorCircleExterne
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width, size.height);

    canvas.drawCircle(center, radius, circle);
    double arcAngle = 2 * pi * (percent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);

    complete.color = Colors.white;
    complete.strokeWidth = width + 1;
    circle.color = colorCircleInterne;

    radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, circle);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);

    var textInterne = TextPainter(textDirection: TextDirection.ltr);
    textInterne.text = TextSpan(
      text: "${(100 - percent).truncate()}",
      style: TextStyle(
        fontSize: 16,
        color: colorCircleInterne,
        // fontWeight: FontWeight.bold,
      ),
    );
    textInterne.layout();
    textInterne.paint(
        canvas,
        Offset(size.width / 2 - radius / 2 - width,
            size.height / 2 - textInterne.size.height / 2));

    var textInterneP = TextPainter(textDirection: TextDirection.ltr);
    textInterneP.text = TextSpan(
      text: "%",
      style: TextStyle(
        fontSize: 10,
        color: colorCircleInterne,
        // fontWeight: FontWeight.bold,
      ),
    );
    textInterneP.layout();
    textInterneP.paint(
        canvas,
        Offset(
            size.width / 2 -
                radius / 2 +
                textInterne.size.width / 2 +
                textInterneP.size.width / 2
            // + textEspace.size.width
            ,
            size.height / 2 - textInterneP.size.height / 4));

    // var textEspace = TextPainter(textDirection: TextDirection.ltr);
    // textEspace.text = TextSpan(
    //   text: "/",
    //   style: TextStyle(
    //     fontSize: 14,
    //     color: Colors.grey,
    //   ),
    // );
    // textEspace.layout();
    // textEspace.paint(
    //     canvas,
    //     Offset(size.width / 2 - radius / 2 - width + textInterne.size.width,
    //         size.height / 2
    //         // + textEspace.size.height / 2
    //         ));

    var textExterne = TextPainter(textDirection: TextDirection.ltr);
    textExterne.text = TextSpan(
      text: "${percent.truncate()}",
      style: TextStyle(
        fontSize: 22,
        color: colorCircleExterne,
        // fontWeight: FontWeight.bold,
      ),
    );
    textExterne.layout();
    textExterne.paint(
        canvas,
        Offset(
            size.width / 2 + radius / 2
            // + textInterne.size.width
            // + textEspace.size.width
            ,
            size.height / 2 - textExterne.size.height / 2));

    var textExterneP = TextPainter(textDirection: TextDirection.ltr);
    textExterneP.text = TextSpan(
      text: "%",
      style: TextStyle(
        fontSize: 10,
        color: colorCircleExterne,
        // fontWeight: FontWeight.bold,
      ),
    );
    textExterneP.layout();
    textExterneP.paint(
        canvas,
        Offset(
            size.width / 2 + radius / 2 + textExterne.size.width
            // + textEspace.size.width
            ,
            size.height / 2 - textExterneP.size.height / 4));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
