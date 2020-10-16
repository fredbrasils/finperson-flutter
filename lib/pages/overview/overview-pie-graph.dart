import 'package:Finperson/component/circle-chart.dart';
import 'package:Finperson/component/line-graph.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry-line-chart.dart';
import 'package:Finperson/pages/main/bottom-background.dart';
import 'package:Finperson/pages/main/menu.dart';
import 'package:Finperson/pages/main/top-background.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class OverviewGraphPie extends StatefulWidget {
  @override
  _OverviewGraphPieState createState() => _OverviewGraphPieState();
}

class _OverviewGraphPieState extends State<OverviewGraphPie> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      // height: SizeConfig.blockSizeVertical * 25,
      child: Row(
        children: [
          Container(
            // color: Colors.black,
            // child: CircleAvatar(
            //   child: Icon(Icons.access_alarm),
            //   maxRadius: 50,
            // ),
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.blockSizeHorizontal * 30,
            child: CustomPaint(
              painter: CircleChart(
                  // percentCircleInterne: 35,
                  percent: 65,
                  colorCircleExterne: Colors.green[900],
                  colorCircleInterne: Colors.red[900]),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 2,
                  vertical: SizeConfig.blockSizeVertical),
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("\$ 35,000.00")
                        ],
                      ),
                      Divider(
                        color: Colors.green[900],
                        height: 15,
                        thickness: 4,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Outcome",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("\$ 30,000.00")
                        ],
                      ),
                      Divider(
                        color: Colors.red[900],
                        height: 15,
                        thickness: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
