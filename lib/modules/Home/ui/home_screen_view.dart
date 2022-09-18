import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/modules/Home/ui/custom_delicious_food.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/combo_screen_one/ui/combo_screen_one_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

import '../controller/home_screen_logic.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put<HomeScreenController>(HomeScreenController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topSliderWidget(),
              10.verticalSpace,
              homeBannerRow(),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Row(children: [
                  Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Advent Pro",
                      color: ColorConstants.primaryBigTextColor,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                      onPressed: () {
                        Get.changeThemeMode(
                            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10.r),
                        backgroundColor: const Color(0xFFFF8A21),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      icon: const Icon(
                        FeatherIcons.shoppingBag,
                        color: Colors.white,
                      ),
                      label: const Text("2")),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (controller.categories.isNotEmpty)
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: CustomWidget.customTitleWithVariation(
                                  context))
                          : Container(),
                      30.verticalSpace,

                      // customer choice
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Text(
                            'Customer’s Choice',
                            style: TextStyle(
                              color: ColorConstants.primaryBigTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              fontFamily: "Advent Pro",
                            ),
                          )),
                      30.verticalSpace,

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: customDeliciousFood(context: context),
                      ),
                      30.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding homeBannerRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 150.h,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: RawMaterialButton(
                onPressed: () => Get.to(ComboScreenViewOne()),
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/home_banner_img_1.png",
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Choose your  COMBO!!',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFF8A21),
                                  fontFamily: "Advent Pro",
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Enjoy customize combo Food, Sides, Drink with few steps.',
                                  maxLines: 3,
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110.w,
                                child: FittedBox(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () =>
                                        Get.to(ComboScreenViewOne()),
                                    label: const Text(
                                      "Lets get started",
                                      style: TextStyle(
                                        // fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFF8A21),
                                        fontFamily: "Advent Pro",
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_right_alt,
                                      color: Color(0xFFFF8A21),
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
                  color: const Color(0xFFEDEDED),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/images/home_banner_img_2.png",
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Looking for YUMMY deal?',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: "Advent Pro",
                              ),
                            ),
                            SizedBox(
                              width: 110.w,
                              child: FittedBox(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () {},
                                  label: const Text(
                                    "Add Deal",
                                    style: TextStyle(
                                      // fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFF8A21),
                                      fontFamily: "Advent Pro",
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_right_alt,
                                    color: Color(0xFFFF8A21),
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
                color: const Color(0xFFF6D1A7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack topSliderWidget() {
    final itemScreenController = Get.find<ItemScreenController>();
    return Stack(
      alignment: Alignment.topRight,
      children: [
        // (!controller.sliders.isNotEmpty)
        //     ? CarouselSlider.builder(
        //         itemCount: controller.sliders.length,
        //         options: CarouselOptions(autoPlay: true, viewportFraction: 1),
        //         itemBuilder:
        //             (BuildContext context, int itemIndex, int pageViewIndex) =>
        //                 OnNetWorkImage(
        //                     url: controller.sliders[itemIndex]['base_url'] +
        //                         controller.sliders[itemIndex]['image']),
        //       )
        //     :
        const Image(image: AssetImage("assets/images/homescreen.png")),
        Positioned(
          top: Dimensions.SizedBoxValue25,
          right: Dimensions.SizedBoxValue15,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.primaryButtonColor,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              onPressed: () {},
              child: Obx(() => itemScreenController.isEatIn.value
                  ? const Text("Eat In")
                  : const Text("Take Out"))),
        ),
        Positioned(
          top: Dimensions.SizedBoxValue25,
          left: Dimensions.SizedBoxValue15,
          child: FloatingActionButton.small(
            backgroundColor: Colors.grey.shade800,
            onPressed: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}
