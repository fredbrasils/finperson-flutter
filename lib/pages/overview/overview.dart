import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview/overview-header.dart';
import 'package:Finperson/config/FinpersonTheme.dart';

class OverviewApp extends StatefulWidget {
  @override
  _OverviewAppState createState() => _OverviewAppState();
}

class _OverviewAppState extends State<OverviewApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overview',
      theme: FinpersonTheme,
      home: Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              OverviewHeader(),
              // Container(
              //   color: Colors.amber,
              //   child: Text('data 3'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
