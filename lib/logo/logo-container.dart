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
        body: SafeArea(
            child: Container(
          color: Colors.black,
          width: 150,
          height: 150,
          child: CustomPaint(
            painter: LogoPainter(),
          ),
        )),
      ),
    );
  }
}
