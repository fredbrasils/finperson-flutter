import 'package:flutter/material.dart';
import 'package:Finperson/pages/overview/overview.dart';
import 'package:Finperson/config/FinpersonTheme.dart';

class FinpersonApp extends StatefulWidget {
  @override
  _FinpersonAppState createState() => _FinpersonAppState();
}

class _FinpersonAppState extends State<FinpersonApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finperson',
      theme: FinpersonTheme,
      home: Scaffold(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Overview(),
              ],
            ),
          ),
          // child: Material(
          //   child: CustomScrollView(
          //     slivers: [
          //       SliverPersistentHeader(
          //         delegate: MySliverAppBar(expandedHeight: 200),
          //         pinned: true,
          //       ),
          //       SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //           (_, index) => ListTile(
          //             title: Text("Index: $index"),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: 400 / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: 400 / 2,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
