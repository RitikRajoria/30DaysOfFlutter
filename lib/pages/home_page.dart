import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 15;
  final String name = "meh";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
      ),
        body: Center(
          child: Container(
            child: Text("Welcome to $days days of flutter by $name."),
          ),
        ),
      drawer: MyDrawer(),
      );
  }
}