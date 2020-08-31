import 'package:Finperson/model/entry.dart';
import 'package:Finperson/service/entryService.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:intl/intl.dart';

class OverviewTransation extends StatefulWidget {
  final Key key;
  final List<Entry> entries;

  OverviewTransation({
    this.key,
    this.entries,
  }) : super(key: key);

  @override
  _OverviewTransationState createState() => _OverviewTransationState();
}

class _OverviewTransationState extends State<OverviewTransation> {
  List<Entry> entries;

  @override
  void initState() {
    super.initState();
    entries = getEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.1,
              color: Theme.of(context).primaryColorLight,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            color: Theme.of(context).primaryColorLight,
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
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
                    Container(
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
                    ),
                    Column(
                      children: entries != null
                          ? List.generate(entries.length, (index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockSizeHorizontal *
                                                    4,
                                            vertical:
                                                SizeConfig.blockSizeVertical),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          child: Icon(
                                              entries[index].category.icon),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 5,
                                        child: VerticalDivider(
                                          color: index < entries.length - 1
                                              ? Colors.white
                                              : Theme.of(context)
                                                  .primaryColorLight,
                                          thickness: 1,
                                          indent: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            DateFormat('yMMMd')
                                                .format(entries[index].data),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.white38),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    3),
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
                              );
                            })
                          : [],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Entry> getEntries() {
    return EntryService().loadEntrys();
  }
}
