import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class CartModel{

  //catalog field
  CatalogModel? _catalog;


  //collection of ids - store IDs of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog!;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id)=> _catalog!.getById(id)).toList();


  //get total Price
  num get totalPrice => items.fold(0, (total, current)=> total + current.price);

  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}