import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../controller/combo_screen_two_logic.dart';

class ComboScreenViewTwo extends GetView<ComboScreenControllertwo> {
  ComboScreenViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ComboScreenControllertwo>();
    controller.getCombo();
    return SafeArea(
      top: true,
      child: Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
                image: AssetImage("assets/images/combobg.png"),
                fit: BoxFit.cover),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                width: context.width,
                height: 80.h,
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // direction: Axis.horizontal,
                    // runSpacing: 10.w,
                    children: [
                      FittedBox(
                        child: Container(
                          height: 76.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE5F2F0),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0.r),
                                      bottomLeft: Radius.circular(8.0.r)),
                                ),
                                child: const Text(
                                  'Small',
                                  style: TextStyle(
                                    fontFamily: "Advent Pro",
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Color(0xFFFF9D89)),
                                  ),
                                  color: Color(0xFFF9EAE7),
                                ),
                                child: const Text(
                                  'Medium',
                                  style: TextStyle(
                                    fontFamily: "Advent Pro",
                                    color: Color(0xFF505050),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE5F2F0),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0.r),
                                      bottomRight: Radius.circular(8.0.r)),
                                ),
                                child: const Text(
                                  'Large',
                                  style: TextStyle(
                                    fontFamily: "Advent Pro",
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.horizontalSpace,
                      SizedBox(
                        height: 80.h,
                        child: Row(
                          children: [
                            FittedBox(
                              child: Container(
                                width: 80.r,
                                height: 80.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/smallburger.png")),
                                  border: Border.all(
                                    width: 2,
                                    color: const Color(0xFF5AB99D),
                                  ),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Container(
                                  width: 50.w,
                                  height: 3,
                                  color: const Color(0xFF5AB99D)),
                            ),
                            FittedBox(
                              child: Container(
                                width: 80.r,
                                height: 80.r,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/smallburger.png")),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: const Color(0xFFDFDFDF),
                                  ),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Container(
                                width: 50.w,
                                height: 3,
                                color: const Color(0xFFDFDFDF),
                              ),
                            ),
                            FittedBox(
                              child: Container(
                                width: 80.r,
                                height: 80.r,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/smallburger.png")),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: const Color(0xFFDFDFDF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Text(
                "Choose your Burger Type",
                style: TextStyle(
                  fontFamily: "Advent Pro",
                  color: Color(0xFF505050),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            10.verticalSpace,
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 210.h,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const Card(
                    color: Colors.red,
                    elevation: 10,
                  );
                },
              ),
            ),
            10.verticalSpace,
            // Container(
            //   height: 56.h,
            //   margin: EdgeInsets.symmetric(horizontal: 14.w),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: Container(
            //         height: 56.h,
            //         padding: const EdgeInsets.all(15),
            //         decoration: const BoxDecoration(color: Color(0xFFE5F2F0)),
            //         child: Row(
            //           children: [
            //             // Container(
            //             //   decoration:
            //             //       const BoxDecoration(color: Color(0xFFFFF4EC)),
            //             //   padding: const EdgeInsets.all(15),
            //             //   child: const Text('SMALL'),
            //             // ),
            //             Text('SMALL'),
            //             Text('MEDIUM'),
            //             Text('LARGE')
            //             // Container(
            //             //   decoration:
            //             //       const BoxDecoration(color: Color(0xFFF9EAE7)),
            //             //   padding: const EdgeInsets.all(15),
            //             //   child: const Text('MEDIUM'),
            //             // ),
            //             // Container(
            //             //   decoration:
            //             //       const BoxDecoration(color: Color(0xFFE5F2F0)),
            //             //   padding: const EdgeInsets.all(15),
            //             //   child: const Text('LARGE'),
            //             // ),
            //           ],
            //         ),
            //       )),
            //       // Expanded(
            //       //     child: Row(
            //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       //   children: [
            //       //     Container(
            //       //         child: Column(
            //       //       children: [
            //       //         Container(
            //       //           margin: const EdgeInsets.only(bottom: 15),
            //       //           decoration: BoxDecoration(
            //       //               // color: ColorConstants.primaryBigTextColor,
            //       //               borderRadius: const BorderRadius.all(
            //       //                   Radius.circular(50)),
            //       //               border: Border.all(
            //       //                   color: ColorConstants.priceborderColor)),
            //       //           child: Image(
            //       //             image: const AssetImage(
            //       //                 "assets/images/smallburger.png"),
            //       //             height: 50.h,
            //       //             width: 60.w,
            //       //           ),
            //       //         ),
            //       //         const Text('Sub Burger')
            //       //       ],
            //       //     )),
            //       //     Container(
            //       //         child: Column(
            //       //       children: [
            //       //         Container(
            //       //           margin: const EdgeInsets.only(bottom: 15),
            //       //           decoration: BoxDecoration(
            //       //               // color: ColorConstants.primaryBigTextColor,
            //       //               borderRadius: const BorderRadius.all(
            //       //                   Radius.circular(50)),
            //       //               border: Border.all(
            //       //                   color: ColorConstants.priceborderColor)),
            //       //           child: Image(
            //       //             image: const AssetImage(
            //       //                 "assets/images/smallburger.png"),
            //       //             height: 50.h,
            //       //             width: 60.w,
            //       //           ),
            //       //         ),
            //       //         const Text('Sub Burger')
            //       //       ],
            //       //     )),
            //       //     Container(
            //       //         child: Column(
            //       //       children: [
            //       //         Container(
            //       //           margin: const EdgeInsets.only(bottom: 15),
            //       //           decoration: BoxDecoration(
            //       //               // color: ColorConstants.primaryBigTextColor,
            //       //               borderRadius: const BorderRadius.all(
            //       //                   Radius.circular(50)),
            //       //               border: Border.all(
            //       //                   color: ColorConstants.priceborderColor)),
            //       //           child: Image(
            //       //             image: const AssetImage(
            //       //                 "assets/images/smallburger.png"),
            //       //             height: 50.h,
            //       //             width: 60.w,
            //       //           ),
            //       //         ),
            //       //         const Text('Sub Burger')
            //       //       ],
            //       //     )),
            //       //   ],
            //       // )),
            //     ],
            //   ),
            // ),
            /*
            const SizedBox(
              height: 30,
            ),
            const Expanded(
              child: ComboMainMenu(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CustomWidget.CustomPrimaryButton(
                        context: context,
                        width: 320.0,
                        height: 60.0,
                        borderradius: 5.0,
                        backgroundcolor:
                            ColorConstants.textFormFieldUnderlineColor,
                        title: 'Cancel Order'),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      // Get.to(AddSidesScreen(
                      //   itemtype: itemtype,
                      // ));
                    },
                    child: CustomWidget.CustomPrimaryButton(
                        context: context,
                        width: 320.0,
                        height: 60.0,
                        borderradius: 5.0,
                        backgroundcolor: ColorConstants.primaryButtonColor,
                        title: 'CONTINUE'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            */
          ],
        ),
      ),
    );
  }

  Widget foodDescription() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage("assets/images/item.png"),
          ),
          SizedBox(
            height: Dimensions.SizedBoxValue20,
          ),
          Text(
            'Chicken Burger',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.TextSize20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Chicken Burger',
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.TextSize18),
          ),
          SizedBox(
            height: Dimensions.SizedBoxValue25,
          ),
          Row(
            children: [
              Text(
                '\$9.00',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TextSize18),
              ),
              const SizedBox(
                width: 60,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(FeatherIcons.plus),
              )
            ],
          )
        ],
      ),
    );
  }
}
