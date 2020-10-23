import 'package:Finperson/component/line-graph.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry-line-chart.dart';
import 'package:Finperson/pages/overview/overview-pie-graph.dart';
import 'package:Finperson/pages/utils.dart/no-data.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  List entries;

  Overview({this.entries});

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  bool isYear = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (datasYear().isEmpty) {
      return NoData();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // color: Colors.amber,
            height: SizeConfig.blockSizeVertical * 4,
            width: SizeConfig.blockSizeHorizontal * 40,
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 4,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 2),
                    decoration: BoxDecoration(
                      color: isYear ? Colors.transparent : Colors.green[900],
                      border: Border.all(
                        color: Colors.green[900],
                        width: 1.0,
                      ),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(20.0)),
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
                      color: isYear ? Colors.green[900] : Colors.transparent,
                      border: Border.all(
                        color: Colors.green[900],
                        width: 1.0,
                      ),
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20.0)),
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
          // LINE CHART
          Container(
            // color: Colors.amber,
            child: LineChartPanel(
                isYear ? datasYear() : datasMonth(), isYear ? 40500 : 5000),
          ),
          // GRAPH PIE
          Container(
              width: SizeConfig.safeScreenWidth,
              height: SizeConfig.blockSizeVertical * 22,
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical * 5,
                  SizeConfig.blockSizeHorizontal * 5,
                  SizeConfig.blockSizeVertical),
              margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5),
              child: OverviewGraphPie()),
        ],
      );
    }
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
