import 'package:Finperson/component/CustomCircleBorder.dart';
import 'package:Finperson/model/entry-category.dart';
import 'package:Finperson/model/entry-type.dart';
import 'package:Finperson/model/entry.dart';
import 'package:Finperson/pages/overview/overview-entry.dart';
import 'package:Finperson/service/entryService.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:intl/intl.dart';

class OverviewDetailCategory extends StatefulWidget {
  final Key key;
  final List<Entry> entries;
  final EntryCategory entryCategory;

  OverviewDetailCategory({
    this.key,
    @required this.entries,
    @required this.entryCategory,
  }) : super(key: key);

  @override
  _OverviewDetailCategoryState createState() => _OverviewDetailCategoryState();
}

class _OverviewDetailCategoryState extends State<OverviewDetailCategory> {
  List<Entry> entries;

  @override
  void initState() {
    super.initState();
    entries = filterEntry(widget.entries, widget.entryCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 4,
              horizontal: SizeConfig.blockSizeHorizontal * 4),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical,
                      left: SizeConfig.blockSizeHorizontal),
                  child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Hero(
                        tag: 'icon-${widget.entryCategory.category.id}',
                        child: Container(
                          child: new CustomPaint(
                            foregroundPainter: CustomCircleBorder(
                                lineColor: Colors.black12,
                                completeColor: Colors.white,
                                completePercent: widget.entryCategory.percent,
                                width: 8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                widget.entryCategory.category.icon,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical,
                          horizontal: SizeConfig.blockSizeHorizontal * 10),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockSizeVertical),
                            child: Text(
                              widget.entryCategory.category.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.white, fontSize: 32),
                            ),
                          ),
                          Container(
                            child: Text(
                              "\$ ${widget.entryCategory.formatedPrice}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: SizeConfig.blockSizeVertical * 6,
                thickness: 1,
                color: Colors.white24,
                indent: SizeConfig.blockSizeHorizontal * 6,
                endIndent: SizeConfig.blockSizeHorizontal * 6,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 6,
                          vertical: SizeConfig.blockSizeVertical),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 6,
                            vertical: SizeConfig.blockSizeVertical),
                        leading: Container(
                          child: Column(
                            children: [
                              Text(
                                DateFormat('MMMd').format(entries[index].data),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white38),
                              ),
                              Text(
                                DateFormat('y').format(entries[index].data),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white38),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          entries[index].description,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white),
                        ),
                        trailing: Text(
                          "\$ ${entries[index].formatedPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Entry> filterEntry(List<Entry> entries, EntryCategory entryCategory) {
  List<Entry> list = entries.where((Entry element) {
    return entryCategory.category.id == element.category.id;
  }).toList();

  return list;
}
