import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityItem extends StatefulWidget {
  String name;
  String image;
  String price;
  bool selected;
  QuantityItem(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      this.selected = false})
      : super(key: key);

  @override
  State<QuantityItem> createState() => _QuantityItemState();
}

class _QuantityItemState extends State<QuantityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Image(
            height: 120.h,
            width: 120.w,
            image: AssetImage("assets/images/item.png")),
        Text('Seeded Bun'),
        Text('\$1.99'),
      ]),
    );
  }
}
