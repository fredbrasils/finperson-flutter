import 'package:flutter/material.dart';
import 'dart:math';

const BLUE_NORMAL = Color(0xff54c5f8);
const GREEN_NORMAL = Color(0xff6bde54);
const BLUE_DARK2 = Color(0xff01579b);
const BLUE_DARK1 = Color(0xff29b6f6);

SizeUtil get _sizeUtil {
  return SizeUtil.getInstance(key: SizeKeyConst.LOGO_KEY);
}

class OpenPainter extends CustomPainter {
  SizeUtil su = _sizeUtil;

  /*void _drawFourShape(Canvas canvas,
      {Offset left_top,
      Offset right_top,
      Offset right_bottom,
      Offset left_bottom,
      Size size,
      paint}) {
    left_top = _convertLogicSize(left_top, size);
    right_top = _convertLogicSize(right_top, size);
    right_bottom = _convertLogicSize(right_bottom, size);
    left_bottom = _convertLogicSize(left_bottom, size);
    var path1 = Path()
      ..moveTo(left_top.dx, left_top.dy)
      ..lineTo(right_top.dx, right_top.dy)
      ..lineTo(right_bottom.dx, right_bottom.dy)
      ..lineTo(left_bottom.dx, left_bottom.dy);
    canvas.drawPath(path1, paint);
  }

  Offset _convertLogicSize(Offset off, Size size) {
    return Offset(su.getAxisX(off.dx), su.getAxisY(off.dy));
  }
*/
  @override
  void paint(Canvas canvas, Size size) {
    //580*648
    print(size);

    if (size.width > 1.0 && size.height > 1.0) {
      su.logicSize = size;
      //}
      // print('width - ${su.width}');
      // print('height - ${su.height}');
      var paint = Paint()
        ..style = PaintingStyle.fill
        ..color = BLUE_NORMAL
        ..isAntiAlias = true;

      /*    _drawFourShape(canvas,
          left_top: Offset(291, 178),
          right_top: Offset(580, 458),
          right_bottom: Offset(580, 628),
          left_bottom: Offset(203, 267),
          size: size,
          paint: paint);
      _drawFourShape(canvas,
          left_top: Offset(156, 314),
          right_top: Offset(312, 468),
          right_bottom: Offset(312, 645),
          left_bottom: Offset(70, 402),
          size: size,
          paint: paint);
      paint.color = BLUE_DARK2;
      _drawFourShape(canvas,
          left_top: Offset(156, 314),
          right_top: Offset(245, 402),
          right_bottom: Offset(4, 643),
          left_bottom: Offset(4, 467),
          size: size,
          paint: paint);
      paint.color = BLUE_DARK1;
      _drawFourShape(canvas,
          left_top: Offset(156, 314),
          right_top: Offset(245, 402),
          right_bottom: Offset(157, 490),
          left_bottom: Offset(70, 402),
          size: size,
          paint: paint);

      var circleCenter = Offset(su.getAxisX(294), su.getAxisY(175));
      paint.color = BLUE_NORMAL;
      canvas.drawCircle(circleCenter, su.getAxisBoth(174), paint);
      paint.color = GREEN_NORMAL;
      canvas.drawCircle(circleCenter, su.getAxisBoth(124), paint);
      paint.color = Colors.white;
      canvas.drawCircle(circleCenter, su.getAxisBoth(80), paint);
*/
      //canvas.drawLine(Offset(0, 0), Offset(0, 100), paint);
      // canvas.drawRect(Rect.fromPoints(Offset(0, 0), Offset(10, 100)), paint);
      // canvas.drawRect(Offset(100, 100) & Size(200, 100), paint);

      var paintLine = Paint()
        ..style = PaintingStyle.fill
        ..color = BLUE_NORMAL
        ..strokeWidth = 2
        ..isAntiAlias = true;

      final colors = [Colors.green[800], Colors.green[400], Colors.green[500]];
      final stops = [0.0, 0.3, 1.0];
      final gradient = LinearGradient(colors: colors, stops: stops);

      paint.color = Colors.green;
      paint.shader = gradient.createShader(Rect.fromLTWH(15, 0, 3, 0));

      canvas.drawLine(Offset(15, 105), Offset(15, 115), paintLine);

/*
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(10, 60, 10, 50), Radius.circular(1.0)),
          paint);
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(10, 50, 10, 50), Radius.circular(10.0)),
          paint);

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

      var path1 = Path()
        ..moveTo(10, 110)
        ..lineTo(10, 60)
        ..lineTo(20, 50)
        ..lineTo(20, 110);
      canvas.drawPath(path1, paint);

      paint.color = Colors.red;
      final gradient2 = LinearGradient(
          colors: [Colors.red[500], Colors.red[300], Colors.red[800]],
          stops: [0.0, 0.3, 1.0]);
      paint.shader = gradient2.createShader(Rect.fromLTWH(29, 0, 3, 0));

      canvas.drawLine(Offset(30, 105), Offset(30, 115), paintLine);

/*
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(25, 80, 10, 30), Radius.circular(1.0)),
          paint);
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(25, 70, 10, 30), Radius.circular(10.0)),
          paint);
*/
      var path2 = Path()
        ..moveTo(25, 110)
        ..lineTo(25, 70)
        ..lineTo(35, 80)
        ..lineTo(35, 110);

      canvas.drawPath(path2, paint);
      paintLine.color = Colors.grey;
      canvas.drawLine(Offset(0, 115), Offset(47, 115), paintLine);
    }
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SizeKeyConst {
  static const DEVICE_KEY = "device_size";
  static const ROUND_ANGLE_KEY = "round_angle_size";
  static const REGULAR_POLYGON_KEY = "regular_angle_size";
  static const CIRCLE_KEY = "circle custom painter";
  static const CIRCLE_TRIANGLE_KEY = "circle triangle painter";
  static const LOGO_KEY = "logo_page_size";
}

class SizeUtil {
  /*static Map<String, SizeUtil> _keyValues = Map();

  static initDesignSize() {
    getInstance(key: SizeKeyConst.ROUND_ANGLE_KEY).designSize =
        Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.REGULAR_POLYGON_KEY).designSize =
        Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.LOGO_KEY).designSize = Size(580, 648.0);
    getInstance(key: SizeKeyConst.CIRCLE_KEY).designSize = Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.CIRCLE_TRIANGLE_KEY).designSize =
        Size(500.0, 500.0);
  }*/

  static SizeUtil getInstance({key = SizeKeyConst.DEVICE_KEY}) {
    /*
    if (_keyValues.containsKey(key)) {
      return _keyValues[key];
    } else {
      _keyValues[key] = SizeUtil();
      return _keyValues[key];
    }*/
    SizeUtil su = SizeUtil();
    su.designSize = Size(580, 648.0);

    return su;
  }

  Size _designSize;

  set designSize(Size size) {
    _designSize = size;
  }

  //logic size in device
  Size _logicalSize;

  //device pixel radio.

  get width {
    return _logicalSize.width;
  }

  get height => _logicalSize.height;

  set logicSize(Size size) {
    _logicalSize = size;
    // print('DSADas ${_logicalSize.width}');
  }

  //@param w is the design w;
  double getAxisX(double w) {
    /*  print('w - $w');
    print('width - $width');
    print('_designSize - ${_designSize.width}');
    print('aaaaaaaaaa - ${(w * width) / _designSize.width}');
*/
    return (w * width) / _designSize.width;
  }

// the y direction
  double getAxisY(double h) {
    return (h * height) / _designSize.height;
  }

  // diagonal direction value with design size s.
  double getAxisBoth(double s) {
    // print('s - $s');
    return s *
        sqrt((width * width + height * height) /
            (_designSize.width * _designSize.width +
                _designSize.height * _designSize.height));
  }
}
