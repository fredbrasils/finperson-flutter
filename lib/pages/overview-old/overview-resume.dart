import 'package:Finperson/pages/utils.dart/dimension.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';

class ResumePanel extends StatefulWidget {
  final String title;
  final String value;
  final NotifierDimension notifier;

  ResumePanel({this.title, this.value, this.notifier});

  @override
  _ResumePanelState createState() => _ResumePanelState();
}

class _ResumePanelState extends State<ResumePanel> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ValueListenableBuilder(
        valueListenable: widget.notifier,
        builder: (BuildContext context, Dimension dimension, Widget child) {
          return Card(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.fromLTRB(
                SizeConfig.blockSizeHorizontal,
                dimension.height,
                SizeConfig.blockSizeHorizontal,
                SizeConfig.blockSizeVertical),
            child: Container(
              constraints:
                  BoxConstraints(minWidth: SizeConfig.blockSizeHorizontal * 25),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 2,
                  vertical: SizeConfig.blockSizeVertical * 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      '${widget.title}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('${widget.value}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
