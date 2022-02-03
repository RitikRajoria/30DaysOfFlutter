import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 15;
  final String name = "meh";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
      ),
        body: ListView.builder(
          itemCount: dummyList.length, 
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index],);
            }, 
            ),
      drawer: MyDrawer(),
      );
  }
}