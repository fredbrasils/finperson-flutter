import 'package:Finperson/logo/logo.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logo',
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.green[900],
        child: FinPersonLogo(),
      ),
    );
  }
}

// class _LogoAppState extends State<LogoApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Logo',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.green[900],
//         body: FinPersonLogo(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: null,
//           backgroundColor: Colors.green[700],
//           child: IconButton(
//             icon: Icon(Icons.add),
//             color: Colors.white,
//             iconSize: 30,
//             onPressed: () {
//               setState(() {});
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
