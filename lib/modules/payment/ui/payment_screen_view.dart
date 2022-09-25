import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/Route/route.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../controller/payment_screen_logic.dart';

class PaymentScreen extends GetView<PaymentScreenController> {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<PaymentScreenController>(PaymentScreenController());
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            const Color(0xFF505050).withOpacity(0.5),
            const Color(0xFF505050).withOpacity(0.1),
          ],
        )),
        child: Scaffold(
          // backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    50.verticalSpace,
                    Text(
                      'Payment',
                      style: TextStyle(
                        color: const Color(0xFF5AB99D),
                        fontSize: 40.sp,
                        fontFamily: "Advent Pro",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'Hurray!! Your order will be sent to the kitchen\nAfter you have completed payment.',
                      style: TextStyle(
                        color: ColorConstants.primaryBigTextColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    50.verticalSpace,
                    SizedBox(
                      height: 250.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.padding30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: paymentWay(
                                    image: "assets/images/paywithcard.png",
                                    flag: 0,
                                    text: 'Pay with Card')),
                            30.horizontalSpace,
                            Expanded(
                                child: paymentWay(
                                    image: "assets/images/paywithcash.png",
                                    flag: 1,
                                    text: 'Pay with Cash')),
                            30.horizontalSpace,
                            Expanded(
                                child: paymentWay(
                                    image: "assets/images/paycounter.png",
                                    flag: 2,
                                    text: 'Pay Counter')),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 200.h),
                    Text(
                      'Total:  \$54.20',
                      style: TextStyle(
                          color: ColorConstants.bannerHeadingTextColor,
                          fontSize: Dimensions.height30),
                    ),
                  ],
                ),
              ),
              Obx(() => controller.controllerValue.value.isNegative
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.padding30),
                          child: SizedBox(
                            height: 60.h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 60.h,
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor:
                                              ColorConstants.primaryButtonColor,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Split Payment',
                                          style: TextStyle(
                                              fontFamily: "",
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700),
                                        )),
                                  ),
                                ),
                                44.horizontalSpace,
                                Expanded(
                                  child: SizedBox(
                                    height: 60.h,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              ColorConstants.primaryButtonColor,
                                          backgroundColor:
                                              ColorConstants.primaryButtonColor,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.PaymentDone);
                                        },
                                        child: Text(
                                          'Payment',
                                          style: TextStyle(
                                              fontFamily: "",
                                              fontSize: 24.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }

  paymentWay({image, text, flag}) {
    return Obx(() {
      return InkWell(
        onTap: () {
          controller.controllerValue.value = flag;
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: controller.controllerValue.value == flag
                          ? ColorConstants.primaryButtonColor
                          : ColorConstants.primaryButtonColor.withOpacity(0.01),
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorConstants.primaryButtonColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Image(
                      image: AssetImage(
                        image.toString(),
                      ),
                      height: 109,
                      width: 126,
                      color: controller.controllerValue.value != 4
                          ? controller.controllerValue.value == flag
                              ? Colors.white
                              : ColorConstants.primaryButtonColor
                                  .withOpacity(0.25)
                          : ColorConstants.primaryButtonColor,
                    ),
                  )),
            ),

            25.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.controllerValue.value == flag
                    ? Container(
                        height: 30.r,
                        width: 30.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorConstants.primaryButtonColor,
                        ),
                        child: Icon(
                          FeatherIcons.check,
                          color: Colors.white,
                          size: 25.r,
                        ),
                      )
                    : const SizedBox(),
                10.horizontalSpace,
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: controller.controllerValue.value == flag
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: controller.controllerValue.value == flag
                          ? ColorConstants.primaryButtonColor
                          : ColorConstants.primaryButtonColor),
                ),
              ],
            ),
            //Spacer(),
            //Text('Total:  \$54.20')
          ],
        ),
      );
    });
  }

  paymentType({image}) {
    return Container(
        height: 25,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorConstants.paymentTypeBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: image,
        ));
  }
}
