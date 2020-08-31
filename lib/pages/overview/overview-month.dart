import 'package:Finperson/component/CustomCircleBorder.dart';
import 'package:Finperson/model/entry.dart';
import 'package:Finperson/model/category.dart';
import 'package:Finperson/service/entryService.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:intl/intl.dart';

class OverviewMonthCategory extends StatefulWidget {
  final Key key;
  final List<Entry> entries;

  OverviewMonthCategory({
    this.key,
    this.entries,
  }) : super(key: key);

  @override
  _OverviewMonthCategoryState createState() => _OverviewMonthCategoryState();
}

class _OverviewMonthCategoryState extends State<OverviewMonthCategory> {
  List<_EntryCategory> entriesCategory;

  @override
  void initState() {
    super.initState();
    entriesCategory = calculateEntries(widget.entries);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Column(
            children: entriesCategory != null
                ? List.generate(entriesCategory.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical),
                      child: ListTile(
                        leading: Container(
                          child: new CustomPaint(
                            foregroundPainter: CustomCircleBorder(
                                lineColor: Colors.black12,
                                completeColor: Colors.white,
                                completePercent: entriesCategory[index].percent,
                                width: 5.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                              child: Icon(
                                entriesCategory[index].category.icon,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          entriesCategory[index].category.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${entriesCategory[index].percent} %",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white30),
                        ),
                        trailing: Text(
                          "\$ ${entriesCategory[index].formatedPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    );
                  })
                : [],
          ),
        ],
      ),
    );
  }

  List<_EntryCategory> calculateEntries(List<Entry> list) {
    double total = 0;
    List<_EntryCategory> listCat = [];

    // remove in future
    list = EntryService().loadEntrys();

    // get the total
    list.forEach((e) => total += e.price);

    for (var i = 0; i < list.length; i++) {
      _EntryCategory eCategory = listCat.singleWhere((_EntryCategory element) {
        return list[i].category.id == element.category.id;
      }, orElse: () => null);

      if (eCategory == null) {
        eCategory = _EntryCategory(
            price: list[i].price,
            percent:
                double.parse((list[i].price * 100 / total).toStringAsFixed(2)),
            category: list[i].category);
        listCat.add(eCategory);
      } else {
        eCategory.price += list[i].price;
        eCategory.percent =
            double.parse((eCategory.price * 100 / total).toStringAsFixed(2));
      }
    }
    return listCat;
  }
}

class _EntryCategory {
  _EntryCategory({
    this.price,
    this.percent,
    this.category,
  });

  double price;
  double percent;
  Category category;

  get formatedPrice {
    var f = new NumberFormat("###,###.00#", "en_US");
    return f.format(price);
  }
}
