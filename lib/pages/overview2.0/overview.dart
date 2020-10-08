import 'package:Finperson/component/line-graph.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry-line-chart.dart';
import 'package:Finperson/pages/overview2.0/bottom-background.dart';
import 'package:Finperson/pages/overview2.0/menu.dart';
import 'package:Finperson/pages/overview2.0/overview-pie-graph.dart';
import 'package:Finperson/pages/overview2.0/top-background.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.safeScreenWidth,
                height: SizeConfig.blockSizeVertical * 25,
                child: Stack(
                  children: [
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
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 2),
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
                    // ..._buildMenu(),
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
              ),
              Container(
                // color: Colors.amber,
                height: SizeConfig.blockSizeVertical * 4,
                width: SizeConfig.blockSizeHorizontal * 40,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeHorizontal * 20,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 2),
                        decoration: BoxDecoration(
                          color:
                              isYear ? Colors.transparent : Colors.green[900],
                          border: Border.all(
                            color: Colors.green[900],
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Month",
                            style: TextStyle(
                              color: isYear ? Colors.black : Colors.white,
                              fontWeight:
                                  isYear ? FontWeight.normal : FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isYear = false;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeHorizontal * 20,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 2),
                        decoration: BoxDecoration(
                          color:
                              isYear ? Colors.green[900] : Colors.transparent,
                          border: Border.all(
                            color: Colors.green[900],
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20.0)),
                        ),
                        child: Center(
                            child: Text(
                          "Year",
                          style: TextStyle(
                            color: isYear ? Colors.white : Colors.black,
                            fontWeight:
                                isYear ? FontWeight.bold : FontWeight.normal,
                          ),
                        )),
                      ),
                      onTap: () {
                        setState(() {
                          isYear = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.amber,
                child: LineChartPanel(
                    isYear ? datasYear() : datasMonth(), isYear ? 40500 : 5000),
              ),
              OverviewGraphPie(),
              Container(
                width: SizeConfig.safeScreenWidth,
                height: SizeConfig.blockSizeVertical * 15,
                child: CustomPaint(painter: BottomBackgroundPainter()),
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

  List<EntryLineChart> datasYear() {
    var _allEntrys = <EntryLineChart>[
      EntryLineChart(
        revenue: 40000,
        dispense: 20400,
        description: '2020',
      ),
      EntryLineChart(
        revenue: 40500,
        dispense: 30500,
        description: '2021',
      ),
    ];

    return _allEntrys;
  }

  List<EntryLineChart> datasMonth() {
    var _allEntrys = <EntryLineChart>[
      EntryLineChart(
        revenue: 4000,
        dispense: 2400,
        description: 'Mars/2020',
      ),
      EntryLineChart(
        revenue: 4500,
        dispense: 3500,
        description: 'Avr/2020',
      ),
      EntryLineChart(
        revenue: 5000,
        dispense: 4900,
        description: 'May/2020',
      ),
      EntryLineChart(
        revenue: 4000,
        dispense: 3000,
        description: 'Jun/2020',
      ),
      EntryLineChart(
        revenue: 4700,
        dispense: 4000,
        description: 'Jul/2020',
      ),
      EntryLineChart(
        revenue: 4500,
        dispense: 4000,
        description: 'Aug/2020',
      ),
      EntryLineChart(
        revenue: 4500,
        dispense: 3500,
        description: 'Set/2020',
      ),
      EntryLineChart(
        revenue: 3900,
        dispense: 3500,
        description: 'Oct/2020',
      ),
      EntryLineChart(
        revenue: 4300,
        dispense: 3000,
        description: 'Nov/2020',
      ),
      EntryLineChart(
        revenue: 4000,
        dispense: 2400,
        description: 'Dec/2020',
      ),
      EntryLineChart(
        revenue: 5000,
        dispense: 4500,
        description: 'Jan/2021',
      ),
      EntryLineChart(
        revenue: 5000,
        dispense: 4000,
        description: 'Fev/2021',
      ),
      EntryLineChart(
        revenue: 4300,
        dispense: 3800,
        description: 'Mars/2021',
      ),
      EntryLineChart(
        revenue: 4000,
        dispense: 4200,
        description: 'Avr/2021',
      ),
      EntryLineChart(
        revenue: 4000,
        dispense: 4300,
        description: 'May/2021',
      ),
    ];

    return _allEntrys;
  }

  // List<Widget> _buildMenu() {
  //   List<Widget> list = new List<Widget>();
  //   double iconSize = 30;

  //   List icons = [
  //     customIcon(Icons.bluetooth),
  //     customIcon(Icons.message),
  //     customIcon(Icons.accessible_forward),
  //     customIcon(Icons.access_alarm),
  //     customIcon(Icons.account_box),
  //   ];

  //   int qnt = icons.length;
  //   int middle = (qnt / 2).truncate() + 1;
  //   print('middle - $middle');

  //   double t = .5 / middle;
  //   int count = 1;

  //   print('t - $t');
  //   for (var i = 0; i < icons.length; i++) {
  //     double percentage = t * (i + 1);
  //     print('percentage1 - $percentage');

  //     if (i + 1 == middle) {
  //       percentage = 0.5;
  //       print('percentage m - $percentage');
  //     } else if (i + 1 > middle) {
  //       percentage = 0.5 + (t * count);
  //       count++;
  //       print('percentage f - $percentage');
  //     }

  //     Offset pos = _calculatePosition(percentage, iconSize);
  //     list.add(Positioned(
  //       top: pos.dy,
  //       left: pos.dx,
  //       child: icons[i],
  //     ));
  //   }

  //   return list;
  // }

  // Offset _calculatePosition(double t, double iconSize) {
  //   double width = SizeConfig.safeScreenWidth;
  //   double height = SizeConfig.blockSizeVertical * 25;
  //   double start = 0.0;

  //   Offset p0 = Offset(start, height);
  //   Offset cp0 = Offset(start, height - height / 1.8);
  //   Offset cp1 = Offset(width, height - height / 1.8);
  //   Offset p1 = Offset(width, height);
  //   // var t = 0.5;

  //   // Ax = ((1 - t) * p0x) + (t * cp0x);
  //   // Ay = ((1 - t) * p0y) + (t * cp0y);
  //   Offset A = Offset(
  //       ((1 - t) * p0.dx) + (t * cp0.dx), ((1 - t) * p0.dy) + (t * cp0.dy));

  //   // Bx = ((1 - t) * cp0x) + (t * cp1x);
  //   // By = ((1 - t) * cp0y) + (t * cp1y);
  //   Offset B = Offset(
  //       ((1 - t) * cp0.dx) + (t * cp1.dx), ((1 - t) * cp0.dy) + (t * cp1.dy));

  //   // Cx = ((1 - t) * cp1x) + (t * p1x);
  //   // Cy = ((1 - t) * cp1y) + (t * p1y);
  //   Offset C = Offset(
  //       ((1 - t) * cp1.dx) + (t * p1.dx), ((1 - t) * cp1.dy) + (t * p1.dy));

  //   // Dx = ((1 - t) * Ax) + (t * Bx);
  //   // Dy = ((1 - t) * Ay) + (t * By);
  //   Offset D =
  //       Offset(((1 - t) * A.dx) + (t * B.dx), ((1 - t) * A.dy) + (t * B.dy));

  //   // Ex = ((1 - t) * Bx) + (t * Cx);
  //   // Ey = ((1 - t) * By) + (t * Cy);
  //   Offset E =
  //       Offset(((1 - t) * B.dx) + (t * C.dx), ((1 - t) * B.dy) + (t * C.dy));

  //   // Px = ((1 - t) * Dx) + (t * Ex);
  //   // Py = ((1 - t) * Dy) + (t * Ey);
  //   Offset P =
  //       Offset(((1 - t) * D.dx) + (t * E.dx), ((1 - t) * D.dy) + (t * E.dy));

  //   return Offset(P.dx - iconSize / 2, P.dy - iconSize / 2);
  // }
}
