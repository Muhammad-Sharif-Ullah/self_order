import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/Home/controller/home_screen_logic.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../../ItemPage/ui/item_screen_view.dart';

Widget customDeliciousFood({required BuildContext context}) {
  HomeScreenController controller = Get.find();

  return Padding(
    padding: EdgeInsets.only(left: 37),
    child: SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: controller.customerChoices.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: InkWell(
                onTap: () {
                  controller.selectedItemColor.value = index;
                  Navigator.pushNamed(context, '/itempagescreen',
                      arguments: PageRouteArguments(
                          data: [],
                          fromPage: 'homescreen',
                          toPage: 'itempageScreen'));
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                        height: 56.h,
                        width: 76.w,
                        errorWidget: (context, url, error) =>
                            Image(image: AssetImage("assets/images/item.png")),
                        imageUrl: controller.customerChoices[index]
                                ['base_url'] +
                            controller.customerChoices[index]['product_image']),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == controller.selectedItemColor.value
                            ? Theme.of(context).buttonColor
                            : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.h, vertical: 6.w),
                        child: Text(
                          '${controller.customerChoices[index]['product_name']}',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: index == controller.selectedItemColor.value
                                  ? Colors.white
                                  : ColorConstants.primaryBigTextColor),
                        ),
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
