import 'package:Finperson/component/line-graph.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry-line-chart.dart';
import 'package:Finperson/pages/category/category.dart';
import 'package:Finperson/pages/main/bottom-background.dart';
import 'package:Finperson/pages/main/menu.dart';
import 'package:Finperson/pages/overview/overview-pie-graph.dart';
import 'package:Finperson/pages/main/top-background.dart';
import 'package:Finperson/pages/overview/overview.dart';
import 'package:Finperson/pages/report/report.dart';
import 'package:Finperson/pages/schedule/schedule.dart';
import 'package:Finperson/pages/transation/transation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int menuSelected = Icons.dashboard.codePoint;
  double iconSize = 30;
  bool isYear = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: SizeConfig.safeScreenWidth,
          height: SizeConfig.safeScreenHeight,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    // color: Colors.black,
                    width: SizeConfig.safeScreenWidth,
                    height: SizeConfig.safeScreenHeight,
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 20,
                        bottom: SizeConfig.blockSizeVertical * 4),
                    child: getMenuPage(),
                  ),

                  // TOP BACKGROUND
                  Container(
                    width: SizeConfig.safeScreenWidth,
                    height: SizeConfig.blockSizeVertical * 25,
                    child: CustomPaint(painter: TopBackgroundPainter()),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 2),
                    child: Container(
                      // color: Colors.amber,
                      height: SizeConfig.blockSizeVertical * 11,
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 50,
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 35,
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockSizeVertical * 2,
                                horizontal: SizeConfig.blockSizeHorizontal * 2),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Bem Vindo,",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Frederico!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    width: SizeConfig.safeScreenWidth,
                    top: (SizeConfig.blockSizeVertical * 12.9),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customIcon(Icons.insert_chart, "Report"),
                          customIcon(Icons.category, "Category"),
                          customIcon(Icons.dashboard, "Overview"),
                          customIcon(Icons.payment, "Transation"),
                          customIcon(Icons.schedule, "Schedule"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // BOTTOM BACKGROUND
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: SizeConfig.safeScreenWidth,
                  height: SizeConfig.blockSizeVertical * 15,
                  child: CustomPaint(painter: BottomBackgroundPainter()),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green[700],
        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          iconSize: 40,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget getMenuPage() {
    if (menuSelected == Icons.schedule.codePoint) {
      return Schedule();
    } else if (menuSelected == Icons.insert_chart.codePoint) {
      return Report();
    } else if (menuSelected == Icons.category.codePoint) {
      return Category();
    } else if (menuSelected == Icons.payment.codePoint) {
      return Transation();
    } else {
      return Overview();
    }
  }

  Widget customIcon(IconData icon, String title) {
    if (menuSelected == icon.codePoint) {
      return CircleAvatar(
        radius: iconSize + 10,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(
            icon,
            size: iconSize + 10,
          ),
          color: Colors.green[900],
          iconSize: iconSize + 10,
          onPressed: () {
            setState(() {
              menuSelected = icon.codePoint;
            });
          },
        ),
      );
    } else {
      return Column(
        children: [
          Text(
            "$title",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
          ),
          IconButton(
            icon: Icon(
              icon,
              size: iconSize,
            ),
            color: Colors.white,
            iconSize: iconSize,
            onPressed: () {
              setState(() {
                menuSelected = icon.codePoint;
              });
            },
          ),
        ],
      );
    }
  }
}
