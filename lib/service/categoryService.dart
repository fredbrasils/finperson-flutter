import 'package:Finperson/model/category.dart';
import 'package:flutter/material.dart';

class CategoryService {
  var allCategorys = <Category>[
    Category(
      id: 0,
      name: 'Home',
      icon: Icons.home,
    ),
    Category(
      id: 1,
      name: 'Food',
      icon: Icons.fastfood,
    ),
    Category(
      id: 2,
      name: 'Transport',
      icon: Icons.directions_bus,
    ),
    Category(
      id: 3,
      name: 'Health',
      icon: Icons.local_hospital,
    ),
    Category(
      id: 4,
      name: 'Travel',
      icon: Icons.flight_takeoff,
    ),
    Category(
      id: 5,
      name: 'Work',
      icon: Icons.work,
    ),
  ];

  List<Category> loadAllCategorys() {
    return allCategorys;
  }

  List<Category> loadCategory(Category cat) {
    return allCategorys.where((Category p) {
      return p.id == cat.id;
    }).toList();
  }

  Category loadCategoryById(num id) {
    return allCategorys.singleWhere((Category p) {
      return p.id == id;
    });
  }
}
