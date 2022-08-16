import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/combo_screen_two/controller/combo_screen_two_logic.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

class ComboCart extends StatefulWidget {
  const ComboCart({Key? key}) : super(key: key);

  @override
  State<ComboCart> createState() => _ComboCartState();
}

class _ComboCartState extends State<ComboCart> {
  var controller = Get.find<ComboScreenControllertwo>();
  @override
  Widget build(BuildContext context) {
    controller.getTotal();
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Container(
              height: 250.h,
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(color: Color(0xFFFFF4EC)),
              padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
              width: double.infinity,
              child: Image(image: AssetImage("assets/images/combo_banner.png")),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
              child: Center(
                child: Text(
                  'Is your order correct?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.TextSize30,
                    color: ColorConstants.primaryButtonColor,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 100.w, right: 100.w),
              child: ListView(
                children: [
                  CustomWidget.ComboCartView(
                      controller.selectedCombo.value, 'main'),
                  CustomWidget.ComboCartView(
                      controller.selectedSide.value, 'side'),
                  CustomWidget.ComboCartView(
                      controller.selectedDrink.value, 'drink'),
                  Divider(
                    color: ColorConstants.borderColor,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Text(
                            'Total:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: Dimensions.TextSize30,
                              color: ColorConstants.primaryButtonColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Text(
                          '\$${controller.comboTotal.value}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.TextSize30,
                            color: ColorConstants.primaryButtonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            height: 70.h,
                            width: 280.w,
                            titlecolor: Color(0xFFFF000E),
                            borderColor: Color(0xFFFF000E),
                            backgroundcolor: Colors.transparent,
                            title: 'Add to cart',
                            titlefontSize: 24.sp,
                            borderradius: 5,
                            titleFontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () => controller.checkOut(),
                        child: CustomWidget.CustomPrimaryButton(
                          context: context,
                          height: 70.h,
                          width: 280.w,
                          title: 'Checkout',
                          titlefontSize: 24.sp,
                          borderradius: 5,
                          backgroundcolor: ColorConstants.primaryColor,
                          titlecolor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
