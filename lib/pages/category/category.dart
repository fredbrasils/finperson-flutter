import 'package:Finperson/pages/utils.dart/no-data.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  List entries;

  Category({this.entries = const []});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return NoData();
    } else {
      return Center(
        child: Container(
          child: Text("Category"),
        ),
      );
    }
  }
}
