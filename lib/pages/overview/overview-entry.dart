import 'package:flutter/material.dart';

abstract class OverviewEntry {
  String get title;
  SliverChildBuilderDelegate buildListEntry(BuildContext context);
}
