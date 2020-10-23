import 'package:Finperson/pages/utils.dart/no-data.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  List entries;

  Report({this.entries = const []});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return NoData();
    } else {
      return Center(
        child: Container(
          child: Text("Report"),
        ),
      );
    }
  }
}
