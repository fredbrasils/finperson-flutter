import 'dart:ui';

import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry-line-chart.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/model/entry-bars.dart';

class LineChartPanel extends StatefulWidget {
  List<EntryLineChart> entries;
  double limit;

  LineChartPanel(this.entries, this.limit)
      : assert(entries != null),
        assert(limit != null);

  @override
  _LineChartPanelState createState() => _LineChartPanelState();
}

final double horizontalSpace = 70;
final Color RED = Colors.red[900];
final Color GREEN = Colors.green[900];

class _LineChartPanelState extends State<LineChartPanel> {
  Offset pointClick;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double widthElements = (widget.entries.length * (horizontalSpace + 5));
    double size = widthElements < SizeConfig.safeScreenWidth
        ? SizeConfig.safeScreenWidth
        : widthElements;
    return Container(
      // color: Colors.amber,
      child: SingleChildScrollView(
        reverse: widthElements > SizeConfig.safeScreenWidth,
        scrollDirection: Axis.horizontal,
        child: GestureDetector(
          // onPanDown: (detail) {
          //   setState(() {
          //     pointClick =
          //         Offset(detail.localPosition.dx, detail.localPosition.dy);
          //   });
          //   // print(1);
          //   // print(detail.localPosition.dx);
          // },
          onTapDown: (detail) {
            setState(() {
              pointClick =
                  Offset(detail.localPosition.dx, detail.localPosition.dy);
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 2),
            // color: Colors.amber,
            height: SizeConfig.blockSizeVertical * 30,
            width: size,
            child: CustomPaint(
              painter: _LinePainter(widget.entries, widget.limit, pointClick),
            ),
          ),
        ),
      ),
      // whiteSpace(),
      // Container(
      //   color: Colors.white,
      //   margin: EdgeInsets.symmetric(
      //       horizontal: SizeConfig.blockSizeHorizontal * 2),
      //   height: SizeConfig.blockSizeVertical * 25,
      //   width: 1,
      //   child: CustomPaint(
      //     painter: _LineBasePainter(),
      //   ),
      // ),
      // Align(
      //   alignment: Alignment.topRight,
      //   child: whiteSpace(),
      // ),
      //   ],
      // ),
    );
  }

  // Widget whiteSpace() {
  //   return Container(
  //     color: Colors.white,
  //     height: SizeConfig.blockSizeVertical * 25,
  //     width: SizeConfig.blockSizeHorizontal * 2,
  //   );
  // }
}

class _LinePainter extends CustomPainter {
  List<EntryLineChart> entries;
  double limit;
  Offset pointClick;

  _LinePainter(this.entries, this.limit, this.pointClick);

  Paint paintLineRevenue = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..color = GREEN
    ..strokeWidth = 2;

  // final gradientRevenue = LinearGradient(colors: [
  //   Colors.green[900],
  //   Colors.green[500],
  //   Colors.green[200],
  //   Colors.green[100]
  // ], stops: [
  //   0.0,
  //   0.3,
  //   0.7,
  //   1.0
  // ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  Paint paintLineDispense = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..color = RED
    ..strokeWidth = 2;

  // final gradientDispense = LinearGradient(colors: [
  //   Colors.red[900],
  //   Colors.red[500],
  //   Colors.red[200],
  //   Colors.red[100]
  // ], stops: [
  //   0.0,
  //   0.3,
  //   0.7,
  //   1.0
  // ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  var paintPointClickRevenue = Paint()
    ..color = GREEN
    ..style = PaintingStyle.fill;

  var paintPointClickDispense = Paint()
    ..color = RED
    ..style = PaintingStyle.fill;

  var paintPointClickGrey = Paint()
    ..color = Colors.grey
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;

  var paintPointClickWhite = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  double fontSize = 12.0;
  Offset pointCicle;
  Paint paintCicle;
  double radiusPaintCicleMax = 8;
  double radiusPaintCicleMinus = 6;

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double startX = 0.0;
    double startY = height - fontSize;

    Paint paintLinePoint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey;

    // print(pointClick);

// final double controlPointX = lastPoint.x + (valueX - lastPoint.x) / 2;
// path.cubicTo(controlPointX, lastPoint.y, controlPointX, valueY, valueX, valueY);

    // final path = Path()
    //   ..moveTo(0, height)
    //   ..cubicTo(70, 40, 70, 20, 80, 20)
    //   ..cubicTo(90, 20, 90, 80, 100, 80);

    // canvas.drawPath(path, paintLineDispense);

    // canvas.drawPoints(
    //     PointMode.points, [Offset(80, 20), Offset(100, 80)], paintLineRevenue);

    double control = startX;
    double lastSpaceX = horizontalSpace;
    double lastRevenueValue = startY;
    double lastDispenseValue = startY;

    double valueRevenue;
    double valueDispense;

    // paintLineRevenue.shader = gradientRevenue
    //     .createShader(Rect.fromLTWH(0, 0, horizontalSpace, height));

    // paintLineDispense.shader = gradientDispense
    //     .createShader(Rect.fromLTWH(0, 0, horizontalSpace, height));

    entries.asMap().forEach((index, entry) {
      Path pathRevenue = Path();
      Path pathDispense = Path();

      if (valueRevenue == null) {
        pathRevenue.moveTo(startX, startY);
      } else {
        pathRevenue.moveTo(lastSpaceX - horizontalSpace, valueRevenue);
      }

      if (valueDispense == null) {
        pathDispense.moveTo(startX, startY);
      } else {
        pathDispense.moveTo(lastSpaceX - horizontalSpace, valueDispense);
      }

      valueRevenue = heightEntry(entry.revenue, limit, height);
      pathRevenue.cubicTo(control, lastRevenueValue, control, valueRevenue,
          lastSpaceX, valueRevenue);
      lastRevenueValue = valueRevenue;

      valueDispense = heightEntry(entry.dispense, limit, height);
      pathDispense.cubicTo(control, lastDispenseValue, control, valueDispense,
          lastSpaceX, valueDispense);

      lastDispenseValue = valueDispense;

      control = lastSpaceX + (horizontalSpace / 2);
      lastSpaceX += horizontalSpace;

      canvas.drawPath(pathRevenue, paintLineRevenue);
      canvas.drawPath(pathDispense, paintLineDispense);

      var point = lastSpaceX - horizontalSpace;

      var font = FontWeight.normal;

      paintLinePoint.strokeWidth = 0.2;

      if ((pointClick != null &&
              pointClick.dx > (point - horizontalSpace / 2) &&
              pointClick.dx < (point + horizontalSpace / 2)) ||
          (pointCicle == null && index == entries.length - 1)) {
        pointCicle = Offset(lastSpaceX - horizontalSpace,
            valueRevenue < valueDispense ? valueRevenue : valueDispense);
        paintCicle = valueRevenue < valueDispense
            ? paintPointClickRevenue
            : paintPointClickDispense;

        font = FontWeight.bold;
        paintLinePoint.strokeWidth = 1;

        drawToolTip(canvas, entry, pointCicle, radiusPaintCicleMax, paintCicle);
      }

      TextPainter _textPainter = drawDescription(
          entry, valueRevenue, valueDispense, font, lastSpaceX, height, canvas);

      drawDashLine(height, _textPainter, valueRevenue, valueDispense, canvas,
          lastSpaceX, paintLinePoint);

      drawBaseLine(
          paintLinePoint, canvas, startX, height, _textPainter, lastSpaceX);

      // canvas.drawLine(
      //     Offset(
      //         lastSpaceX - horizontalSpace, height - _textPainter.size.height),
      //     Offset(lastSpaceX - horizontalSpace,
      //         valueRevenue < valueDispense ? valueRevenue : valueDispense),
      //     paintLinePoint);
    });

    if (pointCicle != null) {
      canvas.drawCircle(pointCicle, radiusPaintCicleMax, paintPointClickGrey);
      canvas.drawCircle(pointCicle, radiusPaintCicleMax, paintPointClickWhite);
      canvas.drawCircle(pointCicle, radiusPaintCicleMinus, paintCicle);
    }

    canvas.save();
    canvas.restore();
  }

  void drawToolTip(Canvas canvas, EntryLineChart entry, Offset pointCicle,
      double radius, Paint paint) {
    double startX = pointCicle.dx, startY = pointCicle.dy - radius * 2;

    // print('$startX, $startY');

    Path triangle = Path()
      ..moveTo(startX, startY)
      ..lineTo(startX + radius, startY - radius)
      ..lineTo(startX - radius, startY - radius)
      ..lineTo(startX, startY);

    canvas.drawPath(triangle, paint);

    var valueRevenue = TextPainter(textDirection: TextDirection.ltr);
    valueRevenue.text = TextSpan(
      text: "\$ ${entry.revenue.toString()}",
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.grey[900],
        fontWeight: FontWeight.bold,
      ),
    );
    valueRevenue.layout();

    var valueDispense = TextPainter(textDirection: TextDirection.ltr);
    valueDispense.text = TextSpan(
      text: "\$ ${entry.dispense.toString()}",
      style: TextStyle(
        fontSize: fontSize,
        color: RED,
        // color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
    valueDispense.layout();

    var dispenseY = startY - radius - valueRevenue.size.height - 5;
    var revenueY = startY - radius - valueRevenue.size.height - 25;

    Path retangle = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    retangle.addRRect(RRect.fromRectXY(
        Rect.fromPoints(
            Offset(startX + (valueRevenue.size.width / 2) + 5, startY - radius),
            Offset(startX - (valueRevenue.size.width / 2) - 5, revenueY - 5)),
        5,
        5));
    canvas.drawPath(retangle, paint);

    Offset textPoint = Offset(startX - (valueRevenue.size.width / 2), revenueY);
    valueRevenue.paint(canvas, textPoint);

    textPoint = Offset(startX - (valueRevenue.size.width / 2), dispenseY);
    valueDispense.paint(canvas, textPoint);

    paint.style = PaintingStyle.fill;
  }

  void drawBaseLine(Paint paintLinePoint, Canvas canvas, double startX,
      double height, TextPainter _textPainter, double lastSpaceX) {
    paintLinePoint.strokeWidth = 1;
    canvas.drawLine(Offset(startX, height - _textPainter.size.height),
        Offset(lastSpaceX, height - _textPainter.size.height), paintLinePoint);
  }

  void drawDashLine(
      double height,
      TextPainter _textPainter,
      double valueRevenue,
      double valueDispense,
      Canvas canvas,
      double lastSpaceX,
      Paint paintLinePoint) {
    double dashWidth = 9,
        dashSpace = 5,
        beginDash = height - _textPainter.size.height,
        limitDash = valueRevenue < valueDispense ? valueRevenue : valueDispense;

    while (beginDash > limitDash) {
      canvas.drawLine(
          Offset(lastSpaceX - horizontalSpace, beginDash),
          Offset(
              lastSpaceX - horizontalSpace,
              (beginDash - dashWidth) < limitDash
                  ? limitDash
                  : beginDash - dashWidth),
          paintLinePoint);
      beginDash -= dashWidth + dashSpace;
    }
  }

  TextPainter drawDescription(
      EntryLineChart entry,
      double valueRevenue,
      double valueDispense,
      FontWeight font,
      double lastSpaceX,
      double height,
      Canvas canvas) {
    final _textPainter = TextPainter(textDirection: TextDirection.ltr);
    _textPainter.text = TextSpan(
      text: entry.description,
      style: TextStyle(
        backgroundColor: Colors.transparent,
        fontSize: fontSize,
        // fontFamily: icon.fontFamily,
        color: valueRevenue < valueDispense ? GREEN : RED,
        fontWeight: font,
        // shadows: [
        //   Shadow(
        //     blurRadius: 10.0,
        //     // color: Colors.blue,
        //     offset: Offset(0.0, 5.0),
        //   ),
        // ],
      ),
    );

    _textPainter.layout();

    // print('${_textPainter.size} - ${entry.description.length}');

    Offset textPoint = Offset(
        lastSpaceX - horizontalSpace - (_textPainter.size.width / 2),
        height - _textPainter.size.height);
    _textPainter.paint(canvas, textPoint);
    return _textPainter;
  }

  double heightEntry(double value, double limit, double height) {
    return height - (height * value / (limit * 1.8));
  }

  @override
  bool shouldRepaint(_LinePainter oldDelegate) {
    // print(oldDelegate.entries != entries);
    return oldDelegate.entries != entries ||
        oldDelegate.pointClick != pointClick;
  }
}

/** 
 * Left line - Axis Y  
*/
// class _LineBasePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double height = size.height;

//     Paint paintLine = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..color = Colors.grey
//       ..strokeWidth = 2;

//     canvas.drawLine(Offset(0, 0), Offset(0, height), paintLine);

//     canvas.save();
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
