import 'package:flutter/foundation.dart';

class Entry {
  const Entry({
    @required this.revenue,
    @required this.dispense,
    @required this.limit,
  })  : assert(revenue != null),
        assert(dispense != null),
        assert(limit != null);

  final double revenue;
  final double dispense;
  final double limit;
}
