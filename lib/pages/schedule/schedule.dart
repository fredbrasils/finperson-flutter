import 'package:Finperson/pages/utils.dart/no-data.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  List entries;

  Schedule({this.entries = const []});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return NoData();
    } else {
      return Center(
        child: Container(
          child: Text("Schedule"),
        ),
      );
    }
  }
}
