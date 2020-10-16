import 'package:Finperson/model/entry-type.dart';
import 'package:Finperson/model/entry.dart';
import 'package:Finperson/pages/overview-old/overview-entry.dart';
import 'package:Finperson/service/entryService.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';

class OverviewList extends StatefulWidget {
  final Key key;
  final List<Entry> entries;
  final OverviewEntry overviewEntry;

  OverviewList({
    this.key,
    this.entries,
    this.overviewEntry,
  }) : super(key: key);

  @override
  _OverviewListState createState() => _OverviewListState();
}

class _OverviewListState extends State<OverviewList> {
  _EntryType _entryType;

  @override
  void initState() {
    super.initState();
    calculateEntryType(widget.entries);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.33,
        minChildSize: 0.33,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.1,
                color: Theme.of(context).primaryColorLight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
              color: Theme.of(context).primaryColorLight,
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: _Header(
                      expandedHeight: SizeConfig.blockSizeVertical * 17,
                      minExpanded: SizeConfig.blockSizeVertical * 17,
                      entryType: _entryType,
                      title: widget.overviewEntry.title),
                  pinned: true,
                ),
                SliverList(
                  delegate: widget.overviewEntry.buildListEntry(context),
                ),
              ],
            ),
          );
        });
  }

  void calculateEntryType(List<Entry> list) {
    _entryType = new _EntryType();

    list = EntryService().loadEntrys();
    list.forEach((e) {
      if (e.type == EntryType.DISPENSE) {
        _entryType.dispense += e.price;
      } else {
        _entryType.revenue += e.price;
      }
    });
  }
}

class _Header extends SliverPersistentHeaderDelegate {
  final String title;
  final double expandedHeight;
  final double minExpanded;
  final _EntryType entryType;

  _Header(
      {@required this.title,
      @required this.expandedHeight,
      @required this.minExpanded,
      @required this.entryType});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.1,
              color: Theme.of(context).primaryColorLight,
            ),
            borderRadius: ((shrinkOffset / expandedHeight) > 0)
                ? BorderRadius.vertical(top: Radius.circular(0.0))
                : BorderRadius.vertical(top: Radius.circular(40.0)),
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                height: SizeConfig.blockSizeVertical,
                width: SizeConfig.blockSizeHorizontal * 15,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.1,
                    color: Colors.grey[400],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey[400],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.blockSizeHorizontal * 2,
                      SizeConfig.blockSizeVertical * 4,
                      SizeConfig.blockSizeHorizontal * 2,
                      SizeConfig.blockSizeVertical),
                  child: Text(
                    '$title',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Colors.white),
                  ),
                ),
                Opacity(
                  opacity: shrinkOffset / expandedHeight,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal * 4,
                        top: SizeConfig.blockSizeVertical * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "Revenue: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Text(
                                "\$ ${entryType.revenue}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "Dispense: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Text(
                                "\$ ${entryType.dispense}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.white54,
              indent: SizeConfig.blockSizeHorizontal * 2,
              endIndent: SizeConfig.blockSizeHorizontal * 2,
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minExpanded;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class _EntryType {
  _EntryType({
    this.revenue = 0.0,
    this.dispense = 0.0,
  });

  double revenue;
  double dispense;
}
