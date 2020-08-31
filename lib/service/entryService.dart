import 'package:Finperson/model/category.dart';
import 'package:Finperson/model/entry-type.dart';
import 'package:Finperson/model/entry.dart';
import 'package:Finperson/service/categoryService.dart';

class EntryService {
  var _allEntrys = <Entry>[
    Entry(
      id: 0,
      price: 120,
      data: DateTime.parse("2020-08-05 20:18:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(3),
      description: 'Jean Coutu',
    ),
    Entry(
      id: 1,
      price: 2000.00,
      data: DateTime.parse("2020-08-05 21:00:00Z"),
      type: EntryType.REVENUE,
      category: CategoryService().loadCategoryById(5),
      description: 'Alithya',
    ),
    Entry(
      id: 2,
      price: 700.00,
      data: DateTime.parse("2020-08-08 20:00:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(1),
      description: 'Maxxi',
    ),
    Entry(
      id: 3,
      price: 250.00,
      data: DateTime.parse("2020-08-10 20:18:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(4),
      description: 'Jean Coutu',
    ),
    Entry(
      id: 4,
      price: 87.00,
      data: DateTime.parse("2020-08-15 20:18:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(2),
      description: 'OPUS',
    ),
    Entry(
      id: 5,
      price: 35.00,
      data: DateTime.parse("2020-08-15 10:15:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(1),
      description: 'MC Donalds',
    ),
    Entry(
      id: 6,
      price: 15.00,
      data: DateTime.parse("2020-08-17 15:12:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(3),
      description: 'Jean Coutu',
    ),
    Entry(
      id: 7,
      price: 76.00,
      data: DateTime.parse("2020-08-18 09:18:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(0),
      description: 'Hydro Quebéc',
    ),
    Entry(
      id: 8,
      price: 67.00,
      data: DateTime.parse("2020-08-20 19:20:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(4),
      description: 'Rental cars',
    ),
    Entry(
      id: 9,
      price: 250.00,
      data: DateTime.parse("2020-08-25 17:18:04Z"),
      type: EntryType.DISPENSE,
      category: CategoryService().loadCategoryById(1),
      description: 'IGA',
    ),
  ];

  List<Entry> loadEntrysByCategory(Category category) {
    return _allEntrys.where((Entry p) {
      return p.category == category;
    }).toList();
  }

  List<Entry> loadEntrysByType(EntryType type) {
    return _allEntrys.where((Entry p) {
      return p.type == type;
    }).toList();
  }

  List<Entry> loadEntrys() {
    return _allEntrys;
  }
}
