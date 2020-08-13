import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Header extends StatefulWidget {
  final GlobalKey counterKey;
  Header(this.counterKey);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50.0,
      margin: EdgeInsets.all(5.0),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.only(bottom: 40.0),
        child: Row(
          key: widget.counterKey,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text('BALANCE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.white)),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Icon(
                                Ionicons.ios_eye_off,
                                // size: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
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

class OverviewHeader extends StatefulWidget {
  @override
  _OverviewHeaderState createState() => _OverviewHeaderState();
}

class _OverviewHeaderState extends State<OverviewHeader> {
  GlobalKey containerKey;
  Header header;

  final ValueNotifier<double> _rowHeight = ValueNotifier<double>(1);

  @override
  void initState() {
    super.initState();
    containerKey = GlobalKey();
    header = Header(containerKey);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _rowHeight.value = containerKey.currentContext.size.height);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        header,
        Card(
          margin: EdgeInsets.fromLTRB(5.0, _rowHeight.value + 50.0, 5.0, 5.0),
          child: Container(
            width: 310,
            height: 200,
            child: Text('afsdfasdfasdfasd',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white)),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              resumePanel("REVENUE", "\$ 0.00"),
              resumePanel("DISPENSE", "\$ 6.00"),
            ],
          ),
        ),
      ],
    );
  }

  Widget resumePanel(String title, String value) =>
      ValueListenableBuilder<double>(
          valueListenable: _rowHeight,
          builder: (BuildContext context, double height, Widget child) {
            return Card(
              color: Theme.of(context).primaryColor,
              margin: EdgeInsets.fromLTRB(5.0, _rowHeight.value, 5.0, 5.0),
              child: Container(
                constraints: BoxConstraints(minWidth: 120.0),
                padding: EdgeInsets.all(12.0),
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      // color: Colors.amber,
                      // alignment: Alignment.center,
                      child: Text('$title',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          // color: Colors.amber,
                          // alignment: Alignment.bottomRight,
                          child: Text('$value',
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
