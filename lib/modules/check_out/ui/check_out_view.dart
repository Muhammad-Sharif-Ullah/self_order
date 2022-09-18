import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/shared/constants/colors.dart';

import '../controller/check_out_logic.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<CheckoutController>(CheckoutController());
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Checkout',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Advent Pro",
                  // fontSize: 40.sp,
                  color: ColorConstants.primaryButtonColor,
                ),
              ),
              Text(
                'Is your order correct?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Advent Pro",
                  // fontSize: 20.sp,
                  color: ColorConstants.primaryButtonColor,
                ),
              ),
            ],
          ),
        ),
        // backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => 10.verticalSpace,
                // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  // return CustomWidget.CustomOrderView();
                  return Card(
                    elevation: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: SizedBox(
                        height: 150.h,
                        child: Row(
                          children: [
                            InkWell(
                              child: const Icon(CupertinoIcons.clear_circled),
                              onTap: () {},
                            ),
                            10.horizontalSpace,
                            Expanded(
                              // height: 80.h,
                              // width: 80.h,
                              child: Image.asset(
                                'assets/images/item.png',
                                // height: 150.h,
                                // width: 150.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Beef Burger Combo",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF505050),
                                    ),
                                  ),
                                  Text(
                                    "+ Frience Fries \n+Pepsi 20 oz",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF505050)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    "1X    \$9.00",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF505050)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.horizontalSpace,
                            Row(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFFB15B),
                                        shape: const StadiumBorder()),
                                    onPressed: () {},
                                    child: Text(
                                      "Combo",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                      ),
                                    )),
                                10.horizontalSpace,
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF8A21),
                                      shape: const StadiumBorder()),
                                  onPressed: () {},
                                  child: Text("Combo",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                // 10.verticalSpace,
                Container(
                  margin: EdgeInsets.all(20.r),
                  // padding: EdgeInsets.all(10.r),
                  color: const Color(0xFFFFF4EC),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add promo:',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: const Color(0xFF505050),
                                ),
                              ),
                              15.verticalSpace,
                              SizedBox(
                                height: 40.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFEDEDED),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.horizontalSpace,
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.black,
                        ),
                        20.horizontalSpace,
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal:',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF505050),
                                    ),
                                  ),
                                  Text(
                                    '\$23.00  \$19.48',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF505050),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal:',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF505050)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    '\$1.85',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF505050)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total:',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF505050),
                                    ),
                                  ),
                                  Text(
                                    '\$21.33',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF505050),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 10.verticalSpace,
                SizedBox(
                  height: 60.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                              ),
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  headerAnimationLoop: false,
                                  isDense: false,
                                  closeIcon: const Icon(
                                      Icons.close_fullscreen_outlined),
                                  title: 'Are you sure want to remove the item',
                                  titleTextStyle: const TextStyle(
                                      fontFamily: 'Advent Pro',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.redAccent),
                                  desc:
                                      'This will remove your order from cart.“OK” for continue  or “Cancel” for back ',
                                  descTextStyle: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF505050),
                                  ),
                                  btnCancelOnPress: () {},
                                  onDismissCallback: (type) {
                                    if (type == DismissType.btnOk) {
                                      final cnt =
                                          Get.find<ItemScreenController>();
                                      cnt.cancelOrderActionCleanCache();
                                      Get.forceAppUpdate();
                                      Get.back();
                                    }
                                    debugPrint(
                                        'Dialog Dismiss from callback $type');
                                  },
                                  btnOkOnPress: () {},
                                ).show();
                              },
                              child: const Text("Cancel Order")),
                        ),
                        20.horizontalSpace,
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5AB99D),
                                ),
                                onPressed: () {},
                                child: const Text("Confirm"))),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
            // Divider(
            //   color: ColorConstants.primaryBigTextColor.withOpacity(0.5),
            //   height: 5,
            // ),
            // SizedBox(
            //   height: Dimensions.SizedBoxValue30,
            // ),
            /*
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  const Text(
                    'Add promo:',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 54,
                    width: 265,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstants.bannerBackgroundColor),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstants.bannerBackgroundColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 54,
                    width: 244,
                    child: Center(
                        child: Text(
                      'Total:      \$43.20',
                      style: TextStyle(
                          color: ColorConstants.primaryBigTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.secondBackgroundColor,
                      border:
                          Border.all(color: ColorConstants.priceborderColor),
                    ),
                  )
                ],
              ),
            ),
           
            SizedBox(
              height: Dimensions.SizedBoxValue30,
            ),
            Divider(
              height: 5,
              color: ColorConstants.textFormFieldUnderlineColor,
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
              child: Row(
                children: [
                  CustomWidget.CustomRedButton(
                      height: Dimensions.height60 * 1.0,
                      width: Dimensions.width320 * 1.0,
                      text: 'cancel order',
                      context: context),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/paymentscreen',
                            arguments: PageRouteArguments(
                                data: [], fromPage: "a", toPage: "b"));
                      },
                      child: CustomWidget.CustomAddtoCartButton(
                        height: Dimensions.height60 * 1.0,
                        width: Dimensions.width320 * 1.0,
                        text: 'Confirm',
                        context: context,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height25,
            ),

            */
          ],
        ),
      ),
    );
  }
}
