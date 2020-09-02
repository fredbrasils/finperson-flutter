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
    Category(
      id: 6,
      name: 'Home1',
      icon: Icons.home,
    ),
    Category(
      id: 7,
      name: 'Food1',
      icon: Icons.fastfood,
    ),
    Category(
      id: 8,
      name: 'Transport1',
      icon: Icons.directions_bus,
    ),
    Category(
      id: 9,
      name: 'Health1',
      icon: Icons.local_hospital,
    ),
    Category(
      id: 10,
      name: 'Travel1',
      icon: Icons.flight_takeoff,
    ),
    Category(
      id: 11,
      name: 'Work1',
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
