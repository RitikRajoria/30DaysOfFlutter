import 'package:flutter/material.dart';


class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String image;
  final String color;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.image, required this.color}); 
}

final products = [
  Item(
    id: "asdasd",
    name: "asdasdas",
    desc: "hhjdfhdjdash hsdjfhsdjh",
    price: 898,
    color: "#33505a",
    image: "https://lh5.googleusercontent.com/proxy/sdVrrPW89fxuHTufgegoz1tFzqZjprNFPPecLa6ZJyCzbDHWKlSCCzN_AMVsklkMHQFgr1gpPUXGEb4GNTBTcunUTCjsO_ImJqGPRMwnjolGkEQC8f6lGS6HQfU3tscghilSBP0okPN-updG044T2dITVo-u6oUSiJFU7pKSKOfr1qO9B-yUCmPaFYvhBYKd1dYRpfhc_fBFatA=w1200-h630-p-k-no-nu",
  ),
];