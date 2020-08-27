import 'package:flutter/material.dart';
import 'package:Finperson/model/entry.dart';

class BarChartPainter extends CustomPainter {
  double column;
  double row;
  Entry entry;

  BarChartPainter(double row, double column, Entry entry) {
    this.row = row;
    this.column = column;
    this.entry = entry;
  }

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
    double sizeColumn = (size.width / column);
    double marginVertical = sizeColumn * 2; // margin top and bottom
    double marginHorizontal = sizeColumn * 3; // margin left and right
    double divider = sizeColumn; // divider bar
    double sizeHorizontalBar =
        ((size.width - (marginHorizontal * 2)) / 2) - divider; // size each bar

    if (size.width > 1.0 && size.height > 1.0) {
      var paintLine = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.grey
        ..strokeWidth = 2
        ..isAntiAlias = true;

      // line base
      canvas.drawLine(
          Offset(0.0, size.height), Offset(size.width, size.height), paintLine);

      // gradient bar revenue
      final colors = [Colors.green[800], Colors.green[400], Colors.green[500]];
      final stops = [0.0, 0.3, 1.0];
      final gradient = LinearGradient(colors: colors, stops: stops);

      var bar = Paint()
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      bar.color = Colors.green;
      // bar.shader = gradient.createShader(Rect.fromLTWH(15, 0, 3, 0));
      bar.shader = gradient.createShader(Rect.fromLTWH(
          marginHorizontal + (sizeHorizontalBar / 2),
          0,
          (sizeHorizontalBar / 2) - 3,
          0));

      // line revenue
      canvas.drawLine(
          Offset(marginHorizontal + (sizeHorizontalBar / 2),
              size.height - marginVertical),
          Offset(marginHorizontal + (sizeHorizontalBar / 2), size.height),
          paintLine);

      double sizeVerticalBarRevenue =
          _heightBar(size, marginVertical, entry.revenue); // height bar revenue

      var barRevenue = Path()
        ..moveTo(marginHorizontal, size.height - marginVertical)
        ..lineTo(marginHorizontal, sizeVerticalBarRevenue + marginVertical)
        ..lineTo(marginHorizontal + sizeHorizontalBar, sizeVerticalBarRevenue)
        ..lineTo(
            marginHorizontal + sizeHorizontalBar, size.height - marginVertical);

      canvas.drawPath(barRevenue, bar);

      // gradient bar dispense
      bar.color = Colors.red;
      final gradient2 = LinearGradient(
          colors: [Colors.red[500], Colors.red[300], Colors.red[800]],
          stops: [0.0, 0.3, 1.0]);

      bar.shader = gradient2.createShader(Rect.fromLTWH(
          size.width - marginHorizontal - (sizeHorizontalBar / 2) - 2,
          0,
          (sizeHorizontalBar / 2) - 2,
          0));

      // line dispense
      canvas.drawLine(
          Offset(size.width - marginHorizontal - (sizeHorizontalBar / 2),
              size.height - marginVertical),
          Offset(size.width - marginHorizontal - (sizeHorizontalBar / 2),
              size.height),
          paintLine);

      double sizeVerticalBarDispense = _heightBar(
          size, marginVertical, entry.dispense); // height bar dispense

      var barDispense = Path()
        ..moveTo(size.width - marginHorizontal, size.height - marginVertical)
        ..lineTo(size.width - marginHorizontal,
            sizeVerticalBarDispense + marginVertical)
        ..lineTo(size.width - marginHorizontal - sizeHorizontalBar,
            sizeVerticalBarDispense)
        ..lineTo(size.width - marginHorizontal - sizeHorizontalBar,
            size.height - marginVertical);

      canvas.drawPath(barDispense, bar);
    }
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  double _heightBar(Size size, double margin, double value) {
    return (size.height - (margin * 2)) -
        (((size.height - (margin * 2)) * value) / entry.limit);
  }
}
