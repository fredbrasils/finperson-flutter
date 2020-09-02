import 'package:Finperson/model/entry.dart';
import 'package:Finperson/pages/overview/overview-entry.dart';
import 'package:Finperson/service/entryService.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:intl/intl.dart';

class OverviewTransation implements OverviewEntry {
  List<Entry> entries;

  OverviewTransation({
    this.entries,
  }) {
    this.entries = getEntries();
    print(this.entries.length);
  }

  @override
  SliverChildBuilderDelegate buildListEntry(BuildContext context) {
    int month = -1;

    return SliverChildBuilderDelegate(
      (_, index) {
        bool showHeader = false;
        if (month != entries[index].data.month) {
          month = entries[index].data.month;
          showHeader = true;
        }

        return Container(
          child: Column(
            children: [
              showHeader == true
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2,
                          vertical: SizeConfig.blockSizeVertical),
                      width: SizeConfig.screenWidth,
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2,
                          vertical: SizeConfig.blockSizeVertical),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Theme.of(context).primaryColorDark,
                      ),
                      child: Text(
                        "August",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white),
                      ),
                    )
                  : Container(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 4,
                            vertical: SizeConfig.blockSizeVertical),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(entries[index].category.icon),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 5,
                        child: VerticalDivider(
                          color: index < entries.length - 1
                              ? Colors.white
                              : Theme.of(context).primaryColorLight,
                          thickness: 1,
                          indent: 1,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            entries[index].description,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Text(
                            DateFormat('yMMMd').format(entries[index].data),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white38),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2,
                            right: SizeConfig.blockSizeHorizontal * 3),
                        child: Text(
                          "\$ ${entries[index].formatedPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      childCount: entries.length,
    );
  }

  List<Entry> getEntries() {
    return EntryService().loadEntrys();
  }

  @override
  String get title => 'TRANSATIONS';
}
