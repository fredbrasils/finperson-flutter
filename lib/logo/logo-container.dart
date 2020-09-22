import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview/overview.dart';
import 'package:Finperson/config/FinpersonTheme.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logo',
      home: Scaffold(
        backgroundColor: Colors.green[900],
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.transparent,
              width: 100,
              height: 100,
              child: FinPersonLogo(),
            ),
          ),
        ),
      ),
    );
  }
}
