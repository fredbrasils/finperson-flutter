import 'package:flutter/foundation.dart';

class EntryLineChart {
  const EntryLineChart({
    @required this.revenue,
    @required this.dispense,
    @required this.description,
  })  : assert(revenue != null),
        assert(dispense != null),
        assert(description != null);

  final double revenue;
  final double dispense;
  final String description;
}
