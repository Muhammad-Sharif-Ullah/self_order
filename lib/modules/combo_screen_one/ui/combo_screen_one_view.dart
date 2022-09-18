import 'package:auto_size_text/auto_size_text.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../../base_widget.dart';

class ComboScreenViewOne extends GetView<ComboScreenControllertwo> {
  String? id;
  ComboScreenViewOne({Key? key, String? id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ComboScreenControllertwo>(ComboScreenControllertwo());
    // controller.selectedCombo.value = id;
    // print('selected combo is ${controller.selectedCombo.value}');
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
        backgroundColor: Colors.white,
        body: DraggableBottomSheet(
          minExtent: 135.h,
          useSafeArea: false,
          curve: Curves.easeIn,
          maxExtent: MediaQuery.of(context).size.height * 0.5,
          previewWidget: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF505050).withOpacity(.5),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.padding30, vertical: 10.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      ),
                      Image.asset("assets/images/up_arrow.png"),
                      const Text(
                        'Total:  \$72.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: SizedBox(
                    height: 60.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFF505050))),
                            ),
                            onPressed: () => Get.back(),
                            child: const Text(
                              "Back",
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.back(),
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFFF000E))),
                            ),
                            child: const Text(
                              "Cancel Combo",
                              style: TextStyle(
                                  color: Color(0xFFFF000E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
          expandedWidget: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF505050).withOpacity(.5),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.padding30, vertical: 10.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      ),
                      Image.asset("assets/images/down_arrow.png"),
                      const Text(
                        'Total:  \$72.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Advent Pro"),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: SizedBox(
                    height: 60.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFF505050))),
                            ),
                            onPressed: () => Get.back(),
                            child: const Text(
                              "Back",
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.back(),
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFFF000E))),
                            ),
                            child: const Text(
                              "Cancel Combo",
                              style: TextStyle(
                                  color: Color(0xFFFF000E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Advent Pro"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
          backgroundWidget: backgroundWidget(),
          onDragging: (pos) {},
        ),
      ),
    );
  }

  Column backgroundWidget() {
    return Column(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(color: ColorConstants.bannerPrimaryColor),
          child: const Image(
            image: AssetImage("assets/images/combobg.png"),
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          'Choose your desire',
          style: TextStyle(
              color: ColorConstants.primaryBigTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              fontFamily: "Advent Pro"),
        ),
        30.verticalSpace,
        LayoutBuilder(builder: (context, constrain) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constrain.maxWidth > 600 ? 4 : 3,
                mainAxisExtent: constrain.maxWidth > 600 ? 300.h : 260.h),
            itemCount: controller.comboSectionImage.length,
            itemBuilder: (BuildContext context, int index) {
              final section =
                  controller.comboSelection.entries.elementAt(index);
              final String image = controller.comboSectionImage[index];
              return RawMaterialButton(
                onPressed: () {
                  controller.selectedSize.value = section.key;
                  Get.to(ComboScreenViewTwo());
                },
                child: SizedBox(
                  height: constrain.maxWidth > 600 ? 300.h : 260.h,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // const Spacer(),
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              image,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              "+10.0",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFF8A21),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            section.value,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 18.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       customDesire(
        //           imageName: const Image(
        //             image: AssetImage("assets/images/small_type.png"),
        //           ),
        //           type: 'small',
        //           flag: 's'),
        //       customDesire(
        //           imageName: const Image(
        //             image: AssetImage("assets/images/medium_type.png"),
        //           ),
        //           type: 'medium',
        //           flag: 'm'),
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 50,
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       customDesire(
        //           imageName: const Image(
        //             image: AssetImage("assets/images/large_type.png"),
        //           ),
        //           type: 'large',
        //           flag: 'l'),
        //       customDesire(
        //           imageName: const Image(
        //             image: AssetImage("assets/images/large_type.png"),
        //           ),
        //           type: 'Extra Large',
        //           flag: 'el')
        //     ],
        //   ),
        // ),
        // const Spacer(),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
        //   child: Row(
        //     children: [
        //       CustomWidget.CustomPrimaryButton(
        //           title: 'Back',
        //           borderradius: 11.0,
        //           backgroundcolor: ColorConstants.bannerBackgroundColor,
        //           height: 60.0,
        //           width: 320.0),
        //       const Spacer(),
        //       CustomWidget.CustomPrimaryButton(
        //           title: 'Cancel Combo',
        //           borderradius: 11.0,
        //           backgroundcolor: ColorConstants.redButtonColor,
        //           height: 60.0,
        //           width: 320.0),
        //     ],
        //   ),
        // ),

        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }

  customDesire({imageName, type, flag}) {
    return GestureDetector(
      onTap: () {
        controller.selectedSize.value = flag;
        Get.to(ComboScreenViewTwo());
      },
      child: Column(
        children: [
          Container(
              height: 167,
              width: 208,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: flag == controller.selectedSize
                    ? ColorConstants.selectedDesire
                    : ColorConstants.unselectedDesire,
              ),
              child: imageName),
          const SizedBox(
            height: 15,
          ),
          Text(
            type,
            style: TextStyle(
                color: ColorConstants.primaryBigTextColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
