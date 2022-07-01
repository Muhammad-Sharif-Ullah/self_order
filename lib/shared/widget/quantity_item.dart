import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityItem extends StatefulWidget {
  const QuantityItem({Key? key}) : super(key: key);

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
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    EdgeInsets.only(left: 8.0, right: 8, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(Icons.remove),
              ),
            ),
            Text(
              '1',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    color: Color(0xFFFF8A21),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
