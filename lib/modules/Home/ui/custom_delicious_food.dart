import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/Home/controller/home_screen_logic.dart';
import 'package:self_order/shared/utils/on_network_image.dart';

Widget customDeliciousFood({required BuildContext context}) {
  HomeScreenController controller = Get.find();

  return SizedBox(
    height: 160.h,
    child: ListView.separated(
      separatorBuilder: (context, index) => 16.horizontalSpace,
      padding: EdgeInsets.only(left: 15.w),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: controller.customerChoices.length,
      itemBuilder: (context, index) {
        return Obx(() {
          return InkWell(
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
                OnNetWorkImage(
                  height: 56.h,
                  width: 76.w,
                  // shape: BoxShape.circle,
                  url: controller.customerChoices[index]['base_url'] +
                      controller.customerChoices[index]['product_image'],
                ),
                // CachedNetworkImage(
                //     height: 56.h,
                //     width: 76.w,
                //     imageUrl: controller.customerChoices[index]
                //             ['base_url'] +
                //         controller.customerChoices[index]['product_image']),
                // SizedBox(
                //   height: 10.h,
                // ),
                10.verticalSpace,
                SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor:
                          index == controller.selectedItemColor.value
                              ? const Color(0xFF5AB99D)
                              : Colors.white,
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: 250.w,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AutoSizeText(
                          '${controller.customerChoices[index]['product_name']}',
                          style: GoogleFonts.roboto(
                            color: index == controller.selectedItemColor.value
                                ? Colors.white
                                : const Color(0xFF505050),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                )
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(100),
                //     color: index == controller.selectedItemColor.value
                //         ? Theme.of(context).buttonColor
                //         : null,
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: 24.h, vertical: 6.w),
                //     child: Text(
                //       '${controller.customerChoices[index]['product_name']}',
                //       style: TextStyle(
                //           fontSize: 14.sp,
                //           fontWeight: FontWeight.w700,
                //           color: index == controller.selectedItemColor.value
                //               ? Colors.white
                //               : ColorConstants.primaryBigTextColor),
                //     ),
                //   ),
                // )
              ],
            ),
          );
        });
      },
    ),
  );
}
