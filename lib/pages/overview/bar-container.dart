import 'package:flutter/material.dart';
import 'package:Finperson/component/bars-chart.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry-bars.dart';

class BarsContainer extends StatelessWidget {
  final Key key;
  final bool focus;

  BarsContainer({
    this.key,
    this.focus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 15,
      margin: focus
          ? EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal)
          : null,
      padding: focus
          ? EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal)
          : null,
      decoration: focus
          ? BoxDecoration(
              border: Border.all(
                width: 0.7,
                color: Theme.of(context).primaryColorDark,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              color: Theme.of(context).primaryColor,
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 15,
            height: SizeConfig.blockSizeVertical * 10,
            child: CustomPaint(
              painter: BarChartPainter(
                10,
                15,
                EntryBars(revenue: 3500.0, dispense: 1000.0, limit: 5000.0),
              ),
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 15,
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical,
                horizontal: SizeConfig.blockSizeHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mars',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .apply(color: focus ? Colors.white : null),
                ),
                Text(
                  '2020',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .apply(color: focus ? Colors.white : null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
