import 'package:Finperson/pages/overview/bar-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/pages/utils.dart/dimension.dart';

class OverviewBody extends StatefulWidget {
  final NotifierDimension notifier;

  OverviewBody({this.notifier});

  @override
  _OverviewBodyState createState() => _OverviewBodyState();
}

class _OverviewBodyState extends State<OverviewBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ValueListenableBuilder(
        valueListenable: widget.notifier,
        builder: (BuildContext context, Dimension header, Widget child) {
          SizeConfig().init(context);
          List<int> text = [1, 2, 3, 4, 5, 6, 7, 9, 9, 10, 11, 12];
          int tab = 0;
          return Container(
            child: Card(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal,
                  top: widget.notifier.value.height +
                      (SizeConfig.blockSizeVertical * 8),
                  right: SizeConfig.blockSizeHorizontal),
              child: Column(
                children: [
                  Container(
                    width: widget.notifier.value.width,
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.blockSizeHorizontal,
                        (SizeConfig.blockSizeVertical * 6),
                        SizeConfig.blockSizeHorizontal,
                        SizeConfig.blockSizeVertical),
                    child: Text(
                      ' BALANCE GRAPHIC',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    width: widget.notifier.value.width,
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.blockSizeVertical),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(text.length, (index) {
                        return BarsContainer(
                          focus: index == 3 ? true : false,
                        );
                      })),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal,
                            right: SizeConfig.blockSizeHorizontal,
                            top: SizeConfig.blockSizeVertical * 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              shape: CircleBorder(
                                side:
                                    BorderSide(width: 0.1, color: Colors.white),
                              ),
                              color: Theme.of(context).primaryColor,
                              elevation: 1.5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockSizeVertical,
                                    horizontal: SizeConfig.blockSizeHorizontal),
                                child: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1.5,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 0.1, color: Colors.grey)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockSizeVertical,
                                    horizontal: SizeConfig.blockSizeHorizontal),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.payment),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 1.5,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 0.1, color: Colors.grey)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockSizeVertical,
                                    horizontal: SizeConfig.blockSizeHorizontal),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(MaterialCommunityIcons
                                          .calendar_clock),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
