import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/Home/controller/home_screen_logic.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/userchoice_screen_logic.dart';

class UserChoiceScreen extends GetView<UserChoiceController> {
  UserChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<UserChoiceController>(UserChoiceController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
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
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/userchoice2.png"),
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Text(
                    'Welcome to Perkins fast ordering',
                    style: TextStyle(
                        color: ColorConstants.primaryBigTextColor,
                        fontSize: 40,
                        fontFamily: 'Advent Pro'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 150.h,
                ),
                SizedBox(
                  height: 241.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Where you’ll be eating today",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorConstants.primaryBigTextColor,
                            fontFamily: 'Advent Pro',
                            fontSize: 40),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Image(
                        image: AssetImage("assets/images/smallburger.png"),
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
                      InkWell(
                        onTap: () => controller.setUserChoice('E'),
                        child: CustomWidget.CustomImageButton(
                          image: Image(
                            image: AssetImage("assets/images/frame1.png"),
                            height: 50.h,
                            width: 60.w,
                          ),
                          color: ColorConstants.bannerHeadingTextColor,
                          text: 'Eat in',
                          width: 290.w,
                          height: 90.h,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => controller.setUserChoice('T'),
                        child: CustomWidget.CustomImageButton(
                          image: Image(
                            image: AssetImage("assets/images/frame1.png"),
                            height: 50.h,
                            width: 60.w,
                          ),
                          color: ColorConstants.primaryButtonColor,
                          text: 'Take out',
                          width: 290.w,
                          height: 90.h,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
