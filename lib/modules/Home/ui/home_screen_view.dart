import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/ItemPage/ui/item_screen_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../../combo_screen_one/ui/combo_screen_one_view.dart';
import '../controller/home_screen_logic.dart';
import 'custom_delicious_food.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeScreenController>(HomeScreenController());
    ItemScreenController itemScreenController = Get.put(ItemScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      (controller.sliders.value.length > 0)
                          ? Container(
                              height: 300.h,
                              width: double.infinity,
                              child: CarouselSlider.builder(
                                itemCount: controller.sliders.value.length,
                                options: CarouselOptions(
                                    autoPlay: true, viewportFraction: 1),
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    CachedNetworkImage(
                                        width: double.infinity,
                                        height: double.infinity,
                                        errorWidget: (context, url, error) => Image(
                                            image: AssetImage(
                                                "assets/images/homescreen.png")),
                                        imageUrl: controller.sliders
                                                .value[itemIndex]['base_url'] +
                                            controller.sliders.value[itemIndex]
                                                ['image']),
                              ),
                            )
                          : Image(
                              image:
                                  AssetImage("assets/images/homescreen.png")),
                      Positioned(
                        top: Dimensions.SizedBoxValue25,
                        right: Dimensions.SizedBoxValue15,
                        child: CustomWidget.CustomButtonInImage(
                            text: 'Eat in', onTap: () {}),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  /// Todo: deleted from desigine ///
                  // Padding(
                  //   padding: EdgeInsets.only(left: 30, right: 30),
                  //   child: Row(children: [
                  //     Text(
                  //       "Enjoy Delicious food",
                  //       style: TextStyle(
                  //           fontSize: Dimensions.TextSize30,
                  //           fontWeight: FontWeight.w700),
                  //     ),
                  //     Spacer(),
                  //     InkWell(
                  //       onTap: () {
                  //         Get.changeThemeMode(
                  //             Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  //       },
                  //       child: Container(
                  //         height: 60.h,
                  //         width: 100.w,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(100),
                  //           color: Colors.white,
                  //           boxShadow: [
                  //             BoxShadow(
                  //                 color: Colors.black.withOpacity(0.5),
                  //                 blurRadius: 0.5),
                  //           ],
                  //         ),
                  //         child: Padding(
                  //           padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(100),
                  //               color: Colors.amber,
                  //             ),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(FeatherIcons.shoppingBag,color: Colors.white,),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ]),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),

                  /// Todo: deleted from desigine ///
                  // customDeliciousFood(context: context ),
                  /// 1st bannerrrr
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 30),
                  //   child: Container(
                  //     height: 150,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: ColorConstants.bannerBackgroundColor,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 40),
                  //           child: Image(
                  //             image: AssetImage("assets/images/bannerImage.png"),
                  //           ),
                  //         ),
                  //         Spacer(),
                  //         /// 1st header
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 20),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'Make your own COMBO!! 🍔 🍟 🍕',
                  //                 overflow: TextOverflow.ellipsis,
                  //                 style: TextStyle(color: ColorConstants.bannerHeadingTextColor),
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Padding(
                  //                   padding: EdgeInsets.only(right: 10),
                  //                   child: Text(
                  //                       'Enjoy customise combo Food, Sides, Drink with few steps.')),
                  //               SizedBox(
                  //                 height: 15,
                  //               ),
                  //               InkWell(
                  //                 onTap: (){
                  //                   Get.to(ComboScreenViewOne());
                  //                 },
                  //                 child: Padding(
                  //                   padding: EdgeInsets.only(left: 20),
                  //                   child: Container(
                  //                     height: 32,
                  //                     width: 161,
                  //                     decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(100),
                  //                       border: Border.all(
                  //                           color: ColorConstants
                  //                               .bannerHeadingTextColor),
                  //                       color: ColorConstants.bannerBackgroundColor,
                  //                     ),
                  //                     child: Row(
                  //                       mainAxisAlignment: MainAxisAlignment.center,
                  //                       children: [
                  //                         Text(
                  //                           'Lets get started',
                  //                           style: TextStyle(
                  //                               color: Colors.deepOrangeAccent),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 10,
                  //                         ),
                  //                         Icon(
                  //                           FeatherIcons.arrowRight,
                  //                           color: Colors.deepOrangeAccent,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Get.to(ComboScreenViewOne(id: '246'));
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Image(
                          image: AssetImage("assets/images/homebg1.png"),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  /// 2nd bannerrrrrrr
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 30),
                  //   child: Container(
                  //     height: 150,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: ColorConstants.secondBackgroundColor,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 40),
                  //           child: Image(
                  //             image: AssetImage("assets/images/bannerImage.png"),
                  //           ),
                  //         ),
                  //         Spacer(),
                  //         /// 1st header
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 20, right: 180),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'Looking for YAMMY deal?',
                  //                 overflow: TextOverflow.ellipsis,
                  //                 style: TextStyle(
                  //                     color: ColorConstants.bannerHeadingTextColor),
                  //               ),
                  //               SizedBox(
                  //                 height: 15,
                  //               ),
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 20),
                  //                 child: Container(
                  //                   height: 32,
                  //                   width: 161,
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(100),
                  //                     border: Border.all(color: ColorConstants.bannerHeadingTextColor),
                  //                     color: Colors.white,
                  //                   ),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     children: [
                  //                       Text(
                  //                         'Started',
                  //                         style: TextStyle(
                  //                             color: Colors.deepOrangeAccent),
                  //                       ),
                  //                       SizedBox(
                  //                         width: 10,
                  //                       ),
                  //                       Icon(
                  //                         FeatherIcons.arrowRight,
                  //                         color: Colors.deepOrangeAccent,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Image(
                        image: AssetImage("assets/images/homebg2.png"),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Row(children: [
                      Text(
                        "Menu",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorConstants.primaryBigTextColor,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.changeThemeMode(Get.isDarkMode
                              ? ThemeMode.light
                              : ThemeMode.dark);
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 0.5),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.amber,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FeatherIcons.shoppingBag,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  (controller.categories.length > 0)
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CustomWidget.CustomTitleWithVariation())
                      : Container(),
                  SizedBox(
                    height: 30.h,
                  ),
                  // customer choice
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        'Customer’s Choice',
                        style: TextStyle(
                            color: ColorConstants.primaryBigTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  customDeliciousFood(context: context),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
