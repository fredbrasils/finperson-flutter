import 'package:flutter/foundation.dart';
import 'package:Finperson/model/entry-type.dart';
import 'package:Finperson/model/category.dart' as cat;
import 'package:intl/intl.dart';

class Entry {
  Entry({
    @required this.id,
    @required this.price,
    @required this.data,
    @required this.type,
    @required this.category,
    @required this.description,
  })  : assert(price != null),
        assert(data != null),
        assert(type != null),
        assert(category != null),
        assert(description != null);

  num id;
  double price;
  DateTime data;
  EntryType type;
  cat.Category category;
  String description;

  get formatedPrice {
    var f = new NumberFormat("###,###.00#", "en_US");
    return f.format(price);
  }
}
