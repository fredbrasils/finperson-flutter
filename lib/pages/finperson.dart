import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview/overview.dart';
import 'package:Finperson/config/FinpersonTheme.dart';

class FinpersonApp extends StatefulWidget {
  @override
  _FinpersonAppState createState() => _FinpersonAppState();
}

class _FinpersonAppState extends State<FinpersonApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finperson',
      theme: FinpersonTheme,
      home: Scaffold(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                OverviewHeaderPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
