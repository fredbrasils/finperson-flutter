import 'package:Finperson/pages/utils.dart/no-data.dart';
import 'package:flutter/material.dart';

class Transation extends StatefulWidget {
  List entries;

  Transation({this.entries = const []});

  @override
  _TransationState createState() => _TransationState();
}

class _TransationState extends State<Transation> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return NoData();
    } else {
      return Center(
        child: Container(
          child: Text("Transation"),
        ),
      );
    }
  }
}
