import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/ItemPage/ui/add_extra_customise.dart';
import 'package:self_order/modules/ItemPage/ui/item_screen_view.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';

class ItemCustomizePage extends StatelessWidget {
  ItemScreenController controller = Get.put(ItemScreenController());
  String id;
  ItemCustomizePage({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getCustomiseFood(id);
    return Obx(
      () => SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Whats on it:',
                              style: TextStyle(
                                fontFamily: "Advent Pro",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: ColorConstants.primaryButtonColor,
                                // fontSize: 24.sp,
                              ),
                            ),
                            Text(
                              'Total:  \$18.36',
                              style: TextStyle(
                                fontFamily: "Advent Pro",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: ColorConstants.bannerHeadingTextColor,
                                // fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/images/customisebug.png",
                              ),
                            ),
                            20.verticalSpace,
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 32.w,
                                  ),
                                  Text(
                                    'Beef Burger',
                                    style: GoogleFonts.roboto(
                                        color:
                                            ColorConstants.primaryBigTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  20.verticalSpace,
                                  // GridView.builder(
                                  //     itemCount: 10,
                                  //     // itemCount: controller
                                  //     //     .customiseFoods.value.length,
                                  //     shrinkWrap: true,
                                  //     gridDelegate:
                                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                                  //       crossAxisCount: 5,
                                  //       childAspectRatio: 2,
                                  //       crossAxisSpacing: 10,
                                  //       mainAxisSpacing: 10,
                                  //     ),
                                  //     itemBuilder: (context, index) {
                                  //       return Stack(
                                  //         children: [
                                  //           Container(
                                  //             height: 50,
                                  //             width: 95,
                                  //             decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         150),
                                  //                 border: Border.all(
                                  //                     color: ColorConstants
                                  //                         .borderColor
                                  //                         .withOpacity(0.02))),
                                  //             child: Center(
                                  //               child: Text(
                                  //                 'kkk',
                                  //                 // '${controller.customiseFoods[index]['name']}',
                                  //                 style: TextStyle(
                                  //                   color: ColorConstants
                                  //                       .primaryBigTextColor,
                                  //                   fontSize: 14,
                                  //                   fontWeight: FontWeight.w400,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           Positioned(
                                  //             right: 5,
                                  //             top: -3,
                                  //             child: Container(
                                  //               height: 20.h,
                                  //               width: 20.w,
                                  //               decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(25),
                                  //                 color: ColorConstants
                                  //                     .bannerHeadingTextColor,
                                  //               ),
                                  //               child: const Icon(
                                  //                 FeatherIcons.x,
                                  //                 color: Colors.white,
                                  //               ),
                                  //             ),
                                  //           )
                                  //         ],
                                  //       );
                                  //     })
                                  Wrap(
                                    runSpacing: 8,
                                    spacing: 10,
                                    direction: Axis.horizontal,
                                    children: [
                                      for (int index = 0;
                                          index <
                                              controller
                                                  .customiseFoods.value.length;
                                          index++)
                                        SizedBox(
                                          height: 50,
                                          // width: 95,
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60.r),
                                                ),
                                                child: Text(
                                                  '${controller.customiseFoods[index]['name']}',
                                                  style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF505050),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: -5,
                                                top: -5,
                                                // alignment: Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        const Color(0xFFC4C4C4),
                                                    radius: 20.r,
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: FittedBox(
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      30.verticalSpace,

                      /// Todo : Add Extra //
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          'Add extra:',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: ColorConstants.primaryButtonColor),
                        ),
                      ),
                      10.verticalSpace,
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, mainAxisExtent: 280.h),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return RawMaterialButton(
                              onPressed: () {
                                addExtraCustomizePage(context: context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: 130,
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            "assets/images/extraFood.png",
                                            height: 70,
                                            width: 130,
                                          ),
                                          Positioned(
                                            right: 0,
                                            child: InkWell(
                                              onTap: () {},
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    const Color(0xFF0FA958),
                                                radius: 20.r,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: FittedBox(
                                                    child: Icon(
                                                      Icons.done,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    10.verticalSpace,
                                    Text(
                                      'Fried Egg Fried Egg',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        color:
                                            ColorConstants.primaryBigTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    10.verticalSpace,
                                    Text(
                                      '\$0.36',
                                      style: GoogleFonts.roboto(
                                        color: ColorConstants
                                            .bannerHeadingTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    14.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 25,
                                            child: FittedBox(
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 1,
                                                  backgroundColor: Colors.white,
                                                ),
                                                child: const Icon(
                                                  Icons.remove,
                                                  // size: 10,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          2.horizontalSpace,
                                          Text(
                                            '10',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: ColorConstants
                                                    .primaryBigTextColor),
                                          ),
                                          2.horizontalSpace,
                                          SizedBox(
                                            height: 20,
                                            width: 25,
                                            child: FittedBox(
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 1,
                                                  backgroundColor: ColorConstants
                                                      .bannerHeadingTextColor,
                                                ),
                                                child: const Icon(
                                                  Icons.remove,
                                                  // size: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child: InkWell(
                      onTap: () {
                        // Get.off(()=> );
                        final cnt = Get.find<ItemScreenController>();
                        cnt.isOrderActive = true.obs;

                        // Get.back();
                        Get.off(() => ItemPageScreen(
                            id: cnt.id.value, title: cnt.title.value));
                        // Navigator.pushNamed(context, '/checkoutPage',
                        //     arguments: PageRouteArguments(
                        //         data: [],
                        //         toPage: "checkoutPage",
                        //         fromPage: "itemcustomisePage"));

                        // Navigator.pushNamed(context, '/home',
                        //     arguments: PageRouteArguments(
                        //         data: [],
                        //         toPage: "checkoutPage",
                        //         fromPage: "itemcustomisePage"));
                      },
                      child: CustomWidget.CustomPrimaryButton(
                          borderradius: 5,
                          backgroundcolor: ColorConstants.primaryButtonColor,
                          height: 60.h,
                          width: Get.width,
                          context: context,
                          title: 'Done',
                          titlefontSize: 24.sp,
                          titlecolor: Colors.white,
                          titleFontWeight: FontWeight.w700),
                    )),
                10.verticalSpace,
              ],
            ),
          )),
    );
  }
}
