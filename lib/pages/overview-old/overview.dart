import 'package:Finperson/pages/overview-old/overview-list-entry.dart';
import 'package:Finperson/pages/overview-old/overview-entry-month.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview-old/overview-head.dart';
import 'package:Finperson/pages/overview-old/overview-resume.dart';
import 'package:Finperson/pages/overview-old/overview-body.dart';
import 'package:Finperson/pages/utils.dart/dimension.dart';
import 'package:Finperson/config/size-config.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  GlobalKey containerKey;

  final NotifierDimension _header =
      NotifierDimension(Dimension(height: 30, width: 30));

  @override
  void initState() {
    super.initState();
    containerKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _header.changeHeader(containerKey.currentContext.size.height,
              containerKey.currentContext.size.width),
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        OverviewHeader(containerKey),
        OverviewBody(notifier: _header),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ResumePanel(
                  title: "REVENUE", value: "\$ 0.00", notifier: _header),
              ResumePanel(
                  title: "DISPENSE", value: "\$ 6.00", notifier: _header),
            ],
          ),
        ),
        OverviewList(
          entries: [],
          overviewEntry: OverviewMonthCategory(entries: []),
          // overviewEntry: OverviewTransation(entries: []),
        )
      ],
    );
  }
}
