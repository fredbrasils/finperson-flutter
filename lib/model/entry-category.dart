import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:Finperson/model/category.dart' as cat;

class EntryCategory {
  EntryCategory({
    this.price,
    this.percent,
    this.category,
  });

  double price;
  double percent;
  cat.Category category;

  get formatedPrice {
    var f = new NumberFormat("###,###.00#", "en_US");
    return f.format(price);
  }
}
