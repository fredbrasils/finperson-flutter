import 'package:flutter/material.dart';

class Dimension {
  double height;
  double width;

  Dimension({this.height, this.width});
}

class NotifierDimension extends ValueNotifier<Dimension> {
  NotifierDimension(Dimension value) : super(value);

  void changeHeader(double height, double width) {
    value.height = height;
    value.width = width;
    notifyListeners();
  }
}
