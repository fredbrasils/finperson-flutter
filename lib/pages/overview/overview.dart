import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview/overview-head.dart';
import 'package:Finperson/pages/overview/overview-resume.dart';
import 'package:Finperson/pages/overview/overview-body.dart';
import 'package:Finperson/pages/utils.dart/dimension.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  GlobalKey containerKey;
  // HeaderPanel headerPanel;

  final NotifierDimension _header =
      NotifierDimension(Dimension(height: 2, width: 2));

  @override
  void initState() {
    super.initState();
    containerKey = GlobalKey();
    // headerPanel = HeaderPanel(containerKey);
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _header.changeHeader(containerKey.currentContext.size.height,
              containerKey.currentContext.size.width)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        // headerPanel,
        OverviewHeader(containerKey),
        // overviewBody(),
        OverviewBody(notifier: _header),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ResumePanel(
                  title: "REVENUE", value: "\$ 0.00", notifier: _header),
              ResumePanel(
                  title: "DISPENSE", value: "\$ 6.00", notifier: _header),
              // resumePanel("REVENUE", "\$ 0.00"),
              // resumePanel("DISPENSE", "\$ 6.00"),
            ],
          ),
        ),
      ],
    );
  }
}
