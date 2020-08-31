import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  Category({
    @required this.id,
    @required this.name,
    @required this.icon,
  })  : assert(id != null),
        assert(name != null),
        assert(icon != null);

  num id;
  String name;
  IconData icon;
}
