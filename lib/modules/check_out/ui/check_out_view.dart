import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/payment/ui/payment_screen_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../base_widget.dart';
import '../controller/check_out_logic.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<CheckoutController>(CheckoutController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              SizedBox(
                height: Dimensions.SizedBoxValue59,
              ),
              Center(
                child: Text(
                  'Is your order correct?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.TextSize30,
                    color: ColorConstants.primaryButtonColor,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width / 2.5,
                      padding: EdgeInsets.only(bottom: 20),
                      child: CustomWidget.CustomOrderView(),
                    );
                  },
                ),
              ),
              Divider(
                color: ColorConstants.primaryBigTextColor.withOpacity(0.5),
                height: 5,
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue30,
              ),
              Container(
                color: ColorConstants.promoColor,
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Add promos'),
                        TextField(),
                      ],
                    )),
                    Divider(
                      height: 100.h,
                      thickness: 5,
                      color: Colors.black,
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(40.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub Total',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                '1800',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                '300',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                '1600',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.SizedBoxValue30,
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
                    Spacer(),
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
            ],
          ),
        ),
      ),
    );
  }
}
