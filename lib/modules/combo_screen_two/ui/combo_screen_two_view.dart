import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/combo_screen_two/ui/ComboDrinkMenu.dart';
import 'package:self_order/modules/combo_screen_two/ui/ComboMainMenu.dart';
import 'package:self_order/modules/combo_screen_two/ui/ComboSideMenu.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_cart.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../Add_Sides/ui/add_side_screen_view.dart';
import '../../base_widget.dart';
import '../controller/combo_screen_two_logic.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ComboScreenViewTwo extends GetView<ComboScreenControllertwo> {
  ComboScreenViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ComboScreenControllertwo>();
    controller.getCombo();
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/combobg.png"),
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.setSelectedSize('s'),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: (controller.selectedSize == 's')
                                          ? ColorConstants.primaryButtonColor
                                          : Color(0xFFE5F2F0),
                                    ),
                                  ),
                                  color: Color(0xFFFFF4EC)),
                              padding: EdgeInsets.all(15),
                              child: Text('SMALL'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.setSelectedSize('m'),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: (controller.selectedSize == 'm')
                                          ? ColorConstants.primaryButtonColor
                                          : Color(0xFFE5F2F0),
                                    ),
                                  ),
                                  color: Color(0xFFF9EAE7)),
                              padding: EdgeInsets.all(15),
                              child: Text('MEDIUM'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.setSelectedSize('l'),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: (controller.selectedSize == 'l')
                                          ? ColorConstants.primaryButtonColor
                                          : Color(0xFFE5F2F0),
                                    ),
                                  ),
                                  color: Color(0xFFE5F2F0)),
                              padding: const EdgeInsets.all(15),
                              child: const Text('LARGE'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.setSelectedSize('el'),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: (controller.selectedSize == 'el')
                                          ? ColorConstants.primaryButtonColor
                                          : Color(0xFFE5F2F0),
                                    ),
                                  ),
                                  color: Color(0xFFE5F2F0)),
                              padding: EdgeInsets.all(15),
                              child: Text('EX LARGE'),
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    // color: ColorConstants.primaryBigTextColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        width: 2.0,
                                        color: ColorConstants.primaryColor)),
                                child: (controller.selectedComboId.value != '')
                                    ? CachedNetworkImage(
                                        height: 50.h,
                                        width: 50.w,
                                        errorWidget: (context, url, error) =>
                                            Image(
                                                image: AssetImage(
                                                    "assets/images/item.png")),
                                        imageUrl: controller.selectedCombo
                                                .value['base_url'] +
                                            controller.selectedCombo
                                                .value['label_image'])
                                    : Container(),
                              ),
                              (controller.selectedComboId.value != '')
                                  ? Text(
                                      '${controller.selectedCombo.value['label']}',
                                      style: TextStyle(fontSize: 16.sp),
                                    )
                                  : Container()
                            ],
                          ),
                          Container(
                            height: 2.h,
                            margin: EdgeInsets.only(bottom: 20.h),
                            width: 50.w,
                            color: ColorConstants.primaryColor,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        width: 2.0,
                                        color: ColorConstants.primaryColor)),
                                child: (controller.selectedSideId.value != '')
                                    ? CachedNetworkImage(
                                        height: 50.h,
                                        width: 50.w,
                                        errorWidget: (context, url, error) =>
                                            Image(
                                                image: AssetImage(
                                                    "assets/images/item.png")),
                                        imageUrl: controller.selectedSide
                                                .value['base_url'] +
                                            controller.selectedSide
                                                .value['label_image'])
                                    : Container(),
                              ),
                              (controller.selectedSideId.value != '')
                                  ? Text(
                                      '${controller.selectedSide.value['label']}',
                                      style: TextStyle(fontSize: 16.sp),
                                    )
                                  : Container()
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            height: 1.h,
                            width: 50.w,
                            color: ColorConstants.primaryColor,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        width: 2.0,
                                        color: ColorConstants.primaryColor)),
                                child: (controller.selectedDrinkId.value != '')
                                    ? CachedNetworkImage(
                                        height: 50.h,
                                        width: 50.w,
                                        errorWidget: (context, url, error) =>
                                            Image(
                                                image: AssetImage(
                                                    "assets/images/item.png")),
                                        imageUrl: controller.selectedDrink
                                                .value['base_url'] +
                                            controller.selectedSide
                                                .value['label_image'])
                                    : Container(),
                              ),
                              (controller.selectedDrinkId.value != '')
                                  ? Text(
                                      '${controller.selectedDrink.value['label']}',
                                      style: TextStyle(fontSize: 16.sp),
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: (controller.currentStatus.value == 1)
                      ? ComboMainMenu()
                      : (controller.currentStatus.value == 2)
                          ? ComboSideMenu()
                          : ComboDrinkMenu(),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (controller.currentStatus == 3) {
                            controller.currentStatus.value--;
                          } else if (controller.currentStatus == 2) {
                            controller.currentStatus.value--;
                          } else if (controller.currentStatus == 1) {
                            Get.back();
                          }
                        },
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            width: 320.0,
                            height: 70.h,
                            borderradius: 5.0,
                            backgroundcolor: Colors.transparent,
                            titlecolor: Color(0xFF505050),
                            borderColor: Color(0xFF505050),
                            title: 'Back',
                            titlefontSize: 25.sp),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (controller.currentStatus == 1) {
                            controller.currentStatus.value++;
                          } else if (controller.currentStatus == 2) {
                            controller.currentStatus.value++;
                          } else if (controller.currentStatus == 3) {
                            Get.to(ComboCart());
                          }
                        },
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            width: 320.0,
                            height: 70.h,
                            borderradius: 5.0,
                            titlecolor: Color(0xFFFF000E),
                            borderColor: Color(0xFFFF000E),
                            backgroundcolor: Colors.transparent,
                            title: 'CONTINUE',
                            titlefontSize: 25.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
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
          Image(
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
          SizedBox(
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
              SizedBox(
                width: 60,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(FeatherIcons.plus),
              )
            ],
          )
        ],
      ),
    );
  }
}
