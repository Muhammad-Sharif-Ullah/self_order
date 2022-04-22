import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../Home/ui/home_screen_view.dart';
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
          backgroundColor: Theme.of(context).backgroundColor,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Center(child: Image(image: AssetImage("assets/images/paymentimage.png"),height: 82,width: 181,),),
                SizedBox(height: 60,),
                Center(child: Image(image: AssetImage("assets/images/paymentdone.png"),height: 300,width: 322,),),
                SizedBox(height: 30,),
                Text('Your payment was successful',style: TextStyle(fontSize: 48,fontWeight: FontWeight.w700,color: ColorConstants.primaryButtonColor),),
                SizedBox(height: 30,),
                // Container(width:349,child: Text('Please remember to take receipt,It will need to collect food from counter',style: TextStyle(
                //   color: ColorConstants.primaryBigTextColor,
                //   fontSize: 20,
                // ),maxLines: 5,textAlign: TextAlign.center,),),
                Container(
                  width: 349,

                  child: RichText(text: TextSpan(
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: ColorConstants.primaryBigTextColor,),
                    children: [
                      TextSpan(text: 'Please remember to take receipt,It will need to collect food from counter \n',),
                      TextSpan(text: 'Your Order number: ',style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '#D112: ',style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstants.bannerHeadingTextColor)),
                    ]
                  ),),
                ),

                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: (){
                      Get.to(HomeScreen());
                    },
                     child:CustomWidget.CustomPrimaryButton(context: context,borderColor: ColorConstants.primaryButtonColor, borderradius: 5, backgroundcolor: Colors.white,title: 'Order Again',titlecolor: ColorConstants.primaryButtonColor,width: double.infinity,height: 60),
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
