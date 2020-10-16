import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview-old/overview.dart';
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
      theme: finpersonTheme,
      home: Scaffold(
        body: SafeArea(
          child: Overview(),
          // body: SafeArea(
          //   child: Overview(),
          // child: SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //   child: Column(
          //     children: <Widget>[
          //       Overview(),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
