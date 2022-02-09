import 'package:flutter/material.dart';

class CatalogModel {


  static final catModel = CatalogModel._internal(); 

  CatalogModel._internal();

  factory CatalogModel()=> catModel;




  static List<Item>? items;

  //get item by id

  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items![pos];  

}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;
  final String color;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image,
      required this.color});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      image: map["image"],
      color: map["color"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
        "color": color,
      };
}
