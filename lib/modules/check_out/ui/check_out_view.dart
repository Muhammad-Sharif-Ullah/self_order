import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
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
                height: Dimensions.SizedBoxValue100,
              ),
              Center(
                child: Text(
                  'Is your order correct?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.TextSize50,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height90,
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return  Padding(padding: EdgeInsets.only(bottom: 50),
                      child: CustomWidget.CustomOrderView(),
                      );
                    },
                  ),
                ),
              ),
              Center(child: Text('Total:  \$54.20',style: TextStyle(color: ColorConstants.primaryBigTextColor,fontSize: Dimensions.TextSize30),),),
              SizedBox(height: Dimensions.SizedBoxValue30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                child: Row(
                  children: [
                    CustomWidget.CustomRedButton(height: Dimensions.height60*1.0, width: Dimensions.width320*1.0, text: 'cancel order',context: context),
                    Spacer(),
                    CustomWidget.CustomAddtoCartButton(height: Dimensions.height60*1.0, width: Dimensions.width320*1.0, text: 'Payment',context: context,ontap: (){Get.to(PaymentScreen());})

                  ],
                ),
              ),
              SizedBox(height: Dimensions.height25,),
            ],
          ),
        ),
      ),
    );
  }
}
