import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/modules/Home/controller/home_screen_logic.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../controller/userchoice_screen_logic.dart';

class UserChoiceScreen extends GetView<UserChoiceController> {
  const UserChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<UserChoiceController>(UserChoiceController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => ItemScreenController());
    return Scaffold(
      // body: Container(
      //   child: Stack(
      //     children: [
      //       Image(image: AssetImage("assets/images/userchoice2.png")),
      //       Positioned(
      //         top: 70,
      //         left: 80,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Center(
      //               child: Text(
      //                 'Welcome to Perkins fast ordering',
      //                 style: TextStyle(color: ColorConstants.primaryBigTextColor, fontSize: 40,
      //                   fontFamily: 'Advent Pro'
      //
      //                 ),
      //                 textAlign: TextAlign.center,
      //
      //               ),
      //             ),
      //             SizedBox(height: 40,),
      //             Image(image: AssetImage("assets/images/logo.png"),height: 150,)
      //
      //           ],
      //         ),
      //       ),
      //       Positioned(
      //         bottom: 500,
      //         left: 25,
      //         right: 25,
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(left: 35),
      //               child: Row(
      //                 children: [
      //                   Text(
      //                     "Where you’ll be eating today",
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w700,
      //                         color: ColorConstants.primaryBigTextColor,
      //                         fontSize: 40),
      //                   ),
      //                   SizedBox(
      //                     width: 5,
      //                   ),
      //                   Image(
      //                     image: AssetImage("assets/images/smallburger.png"),
      //                     height: 65,
      //                     width: 65,
      //                   )
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               height: 50,
      //             ),
      //             InkWell(
      //               onTap: (){
      //                 Get.to(HomeScreen(),transition: Transition.fade);
      //               },
      //               child: Center(
      //                 child: Row(
      //                   children: [
      //                     CustomWidget.CustomImageButton(
      //                       color: ColorConstants.bannerHeadingTextColor,
      //                       image: Image(
      //                         image: AssetImage("assets/images/frame1.png"),
      //                         height: 50,
      //                         width: 60,
      //                       ),
      //                       text: 'Eat in',
      //                     ),
      //                     SizedBox(
      //                       width: 150,
      //                     ),
      //                     CustomWidget.CustomImageButton(
      //                       color: Theme.of(context).buttonColor,
      //                       image: Image(
      //                         image: AssetImage("assets/images/frame1.png"),
      //                         height: 50,
      //                         width: 60,
      //                       ),
      //                       text: 'Take Out',
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/userchoice2.png",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: Text(
                'Welcome to Perkins fast ordering',
                style: TextStyle(
                    color: ColorConstants.primaryBigTextColor,
                    fontSize: 50.sp,
                    fontFamily: 'Advent Pro'),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Image(
              image: const AssetImage("assets/images/logo.png"),
              height: 150.h,
            ),
            SizedBox(
              height: 241.h,
            ),
            Center(
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Text(
                    "Where you’ll be eating today",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.primaryBigTextColor,
                      fontFamily: 'Advent Pro',
                      fontSize: 40.sp,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Image.asset(
                    "assets/images/smallburger.png",
                    height: 50.h,
                    width: 60.w,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  // InkWell(
                  //   onTap: () => controller.setUserChoice('E'),
                  //   child: CustomWidget.CustomImageButton(
                  //     image: Image(
                  //       image: const AssetImage("assets/images/frame1.png"),
                  //       height: 50.h,
                  //       width: 60.w,
                  //     ),
                  //     color: ColorConstants.bannerHeadingTextColor,
                  //     text: 'Eat in',
                  //     width: 290.w,
                  //     height: 90.h,
                  //   ),
                  // ),
                  Expanded(
                    child: SizedBox(
                      height: 90.h,
                      child: RawMaterialButton(
                        fillColor: ColorConstants.bannerHeadingTextColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          controller.setUserChoice('E');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:
                                  const AssetImage("assets/images/frame1.png"),
                              height: 50.h,
                              width: 60.w,
                            ),
                            35.horizontalSpace,
                            Text(
                              'Eat In',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  64.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 90.h,
                      child: RawMaterialButton(
                        fillColor: ColorConstants.primaryButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          controller.setUserChoice('T');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                  "assets/images/take_out.png"),
                              height: 50.h,
                              width: 60.w,
                            ),
                            35.horizontalSpace,
                            Text(
                              'Take out',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

/*
                  InkWell(
                    onTap: () => controller.setUserChoice('T'),
                    child: CustomWidget.CustomImageButton(
                      image: Image(
                        image: const AssetImage("assets/images/frame1.png"),
                        height: 50.h,
                        width: 50.w,
                      ),
                      color: ColorConstants.primaryButtonColor,
                      text: 'Take Out',
                      width: 290.w,
                      height: 90.h,
                    ),
                  ),
               */
                ],
              ),
            ),
            (MediaQuery.of(context).size.height * .1).verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  print.call("Help Tap");
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Image(
                    image: const AssetImage('assets/images/help.png'),
                    height: 100.h,
                    width: 84.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
