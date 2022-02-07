import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'dart:convert';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 15;

  final String name = "meh";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      // appBar: AppBar(
      //   title: Text("Catalog App"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var captionStyle = context.captionStyle;
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog!.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog!.name.text.lg
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                catalog!.desc.text.textStyle(captionStyle!).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog!.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      child: "Buy".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.p8.rounded.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
