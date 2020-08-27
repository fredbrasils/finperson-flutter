import 'package:Finperson/component/CustomCircleBorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Finperson/component/bars-chart.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:Finperson/model/entry.dart';

class Header {
  double height;
  double width;

  Header({this.height, this.width});
}

class NotifierHeader extends ValueNotifier<Header> {
  NotifierHeader(Header value) : super(value);

  void changeHeader(double height, double width) {
    value.height = height;
    value.width = width;
    notifyListeners();
  }
}

class HeaderPanel extends StatefulWidget {
  final GlobalKey counterKey;
  HeaderPanel(this.counterKey);

  @override
  _HeaderPanelState createState() => _HeaderPanelState();
}

class _HeaderPanelState extends State<HeaderPanel> {
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

class OverviewHeaderPanel extends StatefulWidget {
  @override
  _OverviewHeaderPanelState createState() => _OverviewHeaderPanelState();
}

class _OverviewHeaderPanelState extends State<OverviewHeaderPanel> {
  GlobalKey containerKey;
  HeaderPanel headerPanel;

  final NotifierHeader _header = NotifierHeader(Header(height: 2, width: 2));

  @override
  void initState() {
    super.initState();
    containerKey = GlobalKey();
    headerPanel = HeaderPanel(containerKey);
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
        headerPanel,
        overviewBody(),
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

  Widget overviewBody() => ValueListenableBuilder(
      valueListenable: _header,
      builder: (BuildContext context, Header header, Widget child) {
        SizeConfig().init(context);
        List<int> text = [1, 2, 3, 4, 5, 6, 7, 9, 9, 10, 11, 12];
        int tab = 0;
        return Container(
          // height: SizeConfig.screenHeight - (_header.value.height), // calcular
          child: Card(
            // color: Theme.of(context).primaryColorLight,
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(color: Colors.white, width: 0),
            //   borderRadius: BorderRadius.circular(3.0),
            // ),
            margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal,
                top: _header.value.height + 50.0, // calcular
                right: SizeConfig.blockSizeHorizontal),
            child: Column(
              children: [
                Container(
                  width: _header.value.width,
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal,
                      40.0, // calcular
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
                  // color: Colors.amber,
                  width: _header.value.width,
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.blockSizeVertical),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(text.length, (index) {
                      return Container(
                        // color: Colors.amber,
                        width: SizeConfig.blockSizeHorizontal * 15,
                        margin: index == 3
                            ? EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal)
                            : null,
                        padding: index == 3
                            ? EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal)
                            : null,
                        decoration: index == 3
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
                                  Entry(
                                      revenue: 3500.0,
                                      dispense: 1000.0,
                                      limit: 5000.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mars',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .apply(
                                            color: index == 3
                                                ? Colors.white
                                                : null),
                                  ),
                                  Text(
                                    '2020',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .apply(
                                            color: index == 3
                                                ? Colors.white
                                                : null),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
                  ),
                ),

                // THIS MONTH
                tab == 1
                    ? Column(
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
                                    side: BorderSide(
                                        width: 0.1, color: Colors.white),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  elevation: 1.5,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical,
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal),
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
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal),
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
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal),
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

                          // LIST -> THIS MONTH
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.1,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40.0)),
                              color: Theme.of(context).primaryColorLight,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    height: SizeConfig.blockSizeVertical,
                                    width: SizeConfig.blockSizeHorizontal * 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1,
                                        color: Colors.grey[400],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        SizeConfig.blockSizeHorizontal * 2,
                                        SizeConfig.blockSizeVertical * 4,
                                        SizeConfig.blockSizeHorizontal * 2,
                                        SizeConfig.blockSizeVertical),
                                    child: Text(
                                      "THIS MONTH",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.white54,
                                  indent: SizeConfig.blockSizeHorizontal * 2,
                                  endIndent: SizeConfig.blockSizeHorizontal * 2,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: SizeConfig.blockSizeVertical),
                                  child: ListTile(
                                    leading: Container(
                                      // padding: const EdgeInsets.all(8.0),
                                      child: new CustomPaint(
                                        foregroundPainter: CustomCircleBorder(
                                            lineColor: Colors.black12,
                                            completeColor: Colors.white,
                                            completePercent: 25,
                                            width: 5.0),
                                        // child: new Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Icon(Icons.home),
                                        // ),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Theme.of(context)
                                              .primaryColorLight,
                                          child: Icon(
                                            Icons.home,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "HOME",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      "25%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white30),
                                    ),
                                    trailing: Text(
                                      "\$ 450",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: SizeConfig.blockSizeVertical),
                                  child: ListTile(
                                    leading: Container(
                                      // padding: const EdgeInsets.all(8.0),
                                      child: new CustomPaint(
                                        foregroundPainter: CustomCircleBorder(
                                            lineColor: Colors.black12,
                                            completeColor: Colors.white,
                                            completePercent: 50,
                                            width: 5.0),
                                        // child: new Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Icon(Icons.fastfood),
                                        // ),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Theme.of(context)
                                              .primaryColorLight,
                                          child: Icon(
                                            Icons.fastfood,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "FOOD",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      "50%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white30),
                                    ),
                                    trailing: Text(
                                      "\$ 890",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: SizeConfig.blockSizeVertical),
                                  child: ListTile(
                                    leading: Container(
                                      // padding: const EdgeInsets.all(8.0),
                                      child: new CustomPaint(
                                        foregroundPainter: CustomCircleBorder(
                                            lineColor: Colors.black12,
                                            completeColor: Colors.white,
                                            completePercent: 36,
                                            width: 5.0),
                                        // child: new Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Icon(Icons.directions_bus),
                                        // ),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Theme.of(context)
                                              .primaryColorLight,
                                          child: Icon(
                                            Icons.directions_bus,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "TRANSPORT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      "36%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white30),
                                    ),
                                    trailing: Text(
                                      "\$ 680",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ), // end this month
                          ),
                        ],
                      )
                    :

                    // transation begin
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
                                    side: BorderSide(
                                        width: 0.1, color: Colors.white),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  elevation: 1.5,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockSizeVertical,
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal),
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
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal),
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
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal),
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

                          // LIST -> transations
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.1,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40.0)),
                              color: Theme.of(context).primaryColorLight,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    height: SizeConfig.blockSizeVertical,
                                    width: SizeConfig.blockSizeHorizontal * 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1,
                                        color: Colors.grey[400],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        SizeConfig.blockSizeHorizontal * 2,
                                        SizeConfig.blockSizeVertical * 4,
                                        SizeConfig.blockSizeHorizontal * 2,
                                        SizeConfig.blockSizeVertical),
                                    child: Text(
                                      "TRANSATIONS",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.white54,
                                  indent: SizeConfig.blockSizeHorizontal * 2,
                                  endIndent: SizeConfig.blockSizeHorizontal * 2,
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ////////////// avril
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                            vertical:
                                                SizeConfig.blockSizeVertical),
                                        width: SizeConfig.screenWidth,
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                            vertical:
                                                SizeConfig.blockSizeVertical),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.0)),
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        child: Text(
                                          "Avril",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    vertical: SizeConfig
                                                        .blockSizeVertical),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: Icon(Icons.fastfood),
                                                ),
                                              ),
                                              Container(
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    5,
                                                child: VerticalDivider(
                                                  color: Colors.white,
                                                  thickness: 1,
                                                  indent: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    "MC Donalds",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.black,
                                                  child: Text(
                                                    "30.05",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.white38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                // color: Colors.amber,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                child: Text(
                                                  "\$ 15.90",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    vertical: SizeConfig
                                                        .blockSizeVertical),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: Icon(Icons.fastfood),
                                                ),
                                              ),
                                              Container(
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    5,
                                                child: VerticalDivider(
                                                  color: Colors.white,
                                                  thickness: 1,
                                                  indent: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    "Super C",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.black,
                                                  child: Text(
                                                    "27.05",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.white38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                // color: Colors.amber,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                child: Text(
                                                  "\$ 598.90",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    vertical: SizeConfig
                                                        .blockSizeVertical),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: Icon(Icons.home),
                                                ),
                                              ),
                                              // Container(
                                              //   height: SizeConfig
                                              //           .blockSizeVertical *
                                              //       5,
                                              //   child: VerticalDivider(
                                              //     color: Colors.white,
                                              //     thickness: 1,
                                              //     indent: 1,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    "Louer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.black,
                                                  child: Text(
                                                    "900.45",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.white38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                // color: Colors.amber,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                child: Text(
                                                  "\$ 15.90",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      ////////////// end avril

                                      ////////////// march
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                            vertical:
                                                SizeConfig.blockSizeVertical),
                                        width: SizeConfig.screenWidth,
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                            vertical:
                                                SizeConfig.blockSizeVertical),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.0)),
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        child: Text(
                                          "March",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    vertical: SizeConfig
                                                        .blockSizeVertical),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: Icon(Icons.fastfood),
                                                ),
                                              ),
                                              Container(
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    5,
                                                child: VerticalDivider(
                                                  color: Colors.white,
                                                  thickness: 1,
                                                  indent: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    "Jean Coutu",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.black,
                                                  child: Text(
                                                    "13.03",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.white38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                // color: Colors.amber,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                child: Text(
                                                  "\$ 150.90",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    vertical: SizeConfig
                                                        .blockSizeVertical),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: Icon(Icons.home),
                                                ),
                                              ),
                                              Container(
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    5,
                                                child: VerticalDivider(
                                                  color: Colors.white,
                                                  thickness: 1,
                                                  indent: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    "Loyer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.black,
                                                  child: Text(
                                                    "10.05",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.white38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                // color: Colors.amber,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                child: Text(
                                                  "\$ 1008.90",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal *
                                                        4,
                                                    vertical: SizeConfig
                                                        .blockSizeVertical),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 30,
                                                  child: Icon(Icons.home),
                                                ),
                                              ),
                                              // Container(
                                              //   height: SizeConfig
                                              //           .blockSizeVertical *
                                              //       5,
                                              //   child: VerticalDivider(
                                              //     color: Colors.white,
                                              //     thickness: 1,
                                              //     indent: 1,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    "Louer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.black,
                                                  child: Text(
                                                    "08.03",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.white38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                // color: Colors.amber,
                                                margin: EdgeInsets.only(
                                                    top: SizeConfig
                                                            .blockSizeVertical *
                                                        2,
                                                    right: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3),
                                                child: Text(
                                                  "\$ 230.90",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      ////////////// end march
                                    ],
                                  ),
                                )
                              ],
                            ), // end TRANSATIONS
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      });

  Widget resumePanel(String title, String value) => ValueListenableBuilder(
      valueListenable: _header,
      builder: (BuildContext context, Header header, Widget child) {
        return Card(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.fromLTRB(5.0, header.height, 5.0, 5.0),
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
                  child: Text(
                    '$title',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
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
