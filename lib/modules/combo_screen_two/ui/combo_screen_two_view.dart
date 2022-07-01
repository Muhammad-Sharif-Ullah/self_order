import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/combo_screen_two/ui/ComboDrinkMenu.dart';
import 'package:self_order/modules/combo_screen_two/ui/ComboMainMenu.dart';
import 'package:self_order/modules/combo_screen_two/ui/ComboSideMenu.dart';
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
                          Container(
                            decoration: BoxDecoration(color: Color(0xFFFFF4EC)),
                            padding: EdgeInsets.all(15),
                            child: Text('SMALL'),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Color(0xFFF9EAE7)),
                            padding: EdgeInsets.all(15),
                            child: Text('MEDIUM'),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Color(0xFFE5F2F0)),
                            padding: EdgeInsets.all(15),
                            child: Text('LARGE'),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Color(0xFFE5F2F0)),
                            padding: EdgeInsets.all(15),
                            child: Text('EX LARGE'),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    // color: ColorConstants.primaryBigTextColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: ColorConstants.primaryColor)),
                                child: Image(
                                  image: AssetImage("assets/images/item.png"),
                                  height: 50.h,
                                  width: 60.w,
                                ),
                              ),
                              Text('Sub Burger')
                            ],
                          )),
                          Container(
                            height: 1.h,
                            width: 50.w,
                            color: ColorConstants.primaryColor,
                          ),
                          Container(
                              child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    // color: ColorConstants.primaryBigTextColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: ColorConstants.primaryColor)),
                                child: Image(
                                  image: AssetImage("assets/images/item.png"),
                                  height: 50.h,
                                  width: 60.w,
                                ),
                              ),
                              Text('Sub Burger')
                            ],
                          )),
                          Container(
                            height: 1.h,
                            width: 50.w,
                            color: ColorConstants.primaryColor,
                          ),
                          Container(
                              child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    // color: ColorConstants.primaryBigTextColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: ColorConstants.primaryColor)),
                                child: Image(
                                  image: AssetImage("assets/images/item.png"),
                                  height: 50.h,
                                  width: 60.w,
                                ),
                              ),
                              Text('Sub Burger')
                            ],
                          )),
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
                            height: 60.0,
                            borderradius: 5.0,
                            backgroundcolor: Colors.transparent,
                            titlecolor: Color(0xFF505050),
                            borderColor: Color(0xFF505050),
                            title: 'Back'),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (controller.currentStatus == 1) {
                            controller.currentStatus.value++;
                          } else if (controller.currentStatus == 2) {
                            controller.currentStatus.value++;
                          }
                        },
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            width: 320.0,
                            height: 60.0,
                            borderradius: 5.0,
                            titlecolor: Color(0xFFFF000E),
                            borderColor: Color(0xFFFF000E),
                            backgroundcolor: Colors.transparent,
                            title: 'CONTINUE'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
