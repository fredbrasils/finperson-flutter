import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Finperson/config/size-config.dart';

class OverviewHeader extends StatefulWidget {
  final GlobalKey counterKey;
  OverviewHeader(this.counterKey);

  @override
  _OverviewHeaderState createState() => _OverviewHeaderState();
}

class _OverviewHeaderState extends State<OverviewHeader> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      elevation: 50.0,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal,
          vertical: SizeConfig.blockSizeVertical),
      // margin: EdgeInsets.all(5.0),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        // padding: EdgeInsets.only(bottom: 40.0),
        padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5.5),
        child: Row(
          key: widget.counterKey,
          children: [
            Expanded(
              child: Container(
                // padding: EdgeInsets.all(15.0),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 3,
                    vertical: SizeConfig.blockSizeVertical * 3),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text('BALANCE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.white)),
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 25.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 10),
                              child: Icon(
                                Ionicons.ios_eye_off,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 15.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 4),
                              child: Icon(
                                Ionicons.ios_notifications,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Ionicons.ios_settings,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text('\$ 35,000.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
