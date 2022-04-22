import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:self_order/modules/Home/controller/home_screen_logic.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';

import '../../ItemPage/ui/item_screen_view.dart';

Widget customDeliciousFood({required BuildContext context}) {
  HomeScreenController controller = Get.find();

  return Padding(

    padding: EdgeInsets.only(left: 37),
    child: SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Obx(() {
            return Padding(
              padding: EdgeInsets.only(right: 50),
              child: InkWell(
                onTap: () {
                  controller.selectedItemColor.value = index;
                  Get.to(ItemPageScreen());
                },
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/smallBurger.png"),
                      height: 56,
                      width: 76,),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == controller.selectedItemColor.value
                            ? Theme
                            .of(context)
                            .buttonColor
                            : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24, vertical: 6),
                        child: Text('Burger', style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),),
                      ),
                    )

                  ],
                ),
              ),
            );
          });
        },
      ),
    ),
  );
}


