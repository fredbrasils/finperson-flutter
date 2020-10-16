import 'package:Finperson/component/CustomCircleBorder.dart';
import 'package:Finperson/model/entry-category.dart';
import 'package:Finperson/model/entry.dart';
import 'package:Finperson/model/category.dart';
import 'package:Finperson/pages/overview-old/overview-detail-category.dart';
import 'package:Finperson/pages/overview-old/overview-entry.dart';
import 'package:Finperson/service/entryService.dart';
import 'package:flutter/material.dart';
import 'package:Finperson/config/size-config.dart';
import 'package:intl/intl.dart';

class OverviewMonthCategory implements OverviewEntry {
  List<Entry> entries;
  List<EntryCategory> entriesCategory;

  OverviewMonthCategory({
    this.entries,
  }) {
    entriesCategory = calculateEntries();
  }

  @override
  SliverChildBuilderDelegate buildListEntry(BuildContext context) {
    return SliverChildBuilderDelegate(
      (_, index) => Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OverviewDetailCategory(
                          entries: this.entries,
                          entryCategory: entriesCategory[index],
                        )));
          },
          leading: Hero(
            tag: 'icon-${entriesCategory[index].category.id}',
            child: Container(
              child: new CustomPaint(
                foregroundPainter: CustomCircleBorder(
                    lineColor: Colors.black12,
                    completeColor: Colors.white,
                    completePercent: entriesCategory[index].percent,
                    width: 5.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).primaryColorLight,
                  child: Icon(
                    entriesCategory[index].category.icon,
                    color: Colors.white,
                  ),
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
      ),
      childCount: entriesCategory.length,
    );
  }

  @override
  String get title => 'THIS MONTH';

  List<EntryCategory> calculateEntries() {
    double total = 0;
    List<EntryCategory> listCat = [];

    // remove in future
    this.entries = EntryService().loadEntrys();

    // get the total
    this.entries.forEach((e) => total += e.price);

    for (var i = 0; i < this.entries.length; i++) {
      EntryCategory eCategory = listCat.singleWhere((EntryCategory element) {
        return this.entries[i].category.id == element.category.id;
      }, orElse: () => null);

      if (eCategory == null) {
        eCategory = EntryCategory(
            price: this.entries[i].price,
            percent: double.parse(
                (this.entries[i].price * 100 / total).toStringAsFixed(2)),
            category: this.entries[i].category);
        listCat.add(eCategory);
      } else {
        eCategory.price += this.entries[i].price;
        eCategory.percent =
            double.parse((eCategory.price * 100 / total).toStringAsFixed(2));
      }
    }
    return listCat;
  }
}
