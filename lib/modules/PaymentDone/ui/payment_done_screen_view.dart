// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/UserChoice/ui/userchoice_screen_view.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

import '../../base_widget.dart';
import '../controller/payment_done_screen_logic.dart';

class PaymentDoneScreenView extends GetView<PaymentDoneScreenController> {
  const PaymentDoneScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<PaymentDoneScreenController>(PaymentDoneScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0xFF505050).withOpacity(0.1),
              const Color(0xFF505050).withOpacity(0.0),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'Payment Confirmation',
                  style: TextStyle(
                    color: const Color(0xFF5AB99D),
                    fontSize: 40.sp,
                    fontFamily: "Advent Pro",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/images/check.png"),
                    height: 300,
                    width: 322,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Your payment was successful',
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontFamily: "Advent Pro",
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.primaryButtonColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(width:349,child: Text('Please remember to take receipt,It will need to collect food from counter',style: TextStyle(
                //   color: ColorConstants.primaryBigTextColor,
                //   fontSize: 20,
                // ),maxLines: 5,textAlign: TextAlign.center,),),
                Container(
                  width: 349.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: ColorConstants.primaryBigTextColor,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'Please remember to take receipt,It will need to collect food from counter \n',
                          ),
                          const TextSpan(
                              text: 'Your Order number: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '#D112: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      ColorConstants.bannerHeadingTextColor)),
                        ]),
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.HomeScreen,
                      //     arguments: PageRouteArguments(
                      //         data: [],
                      //         toPage: AppRoutes.HomeScreen,
                      //         fromPage: AppRoutes.Payment));
                      final ItemScreenController itemController =
                          Get.find<ItemScreenController>();
                      itemController.isOrderActive.value = false;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserChoiceScreen()),
                          (route) => false);
                    },
                    child: CustomWidget.CustomPrimaryButton(
                        context: context,
                        borderColor: ColorConstants.primaryButtonColor,
                        borderradius: 5,
                        backgroundcolor: Colors.white,
                        title: 'Order Again',
                        titlecolor: ColorConstants.primaryButtonColor,
                        width: double.infinity,
                        height: 60),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
