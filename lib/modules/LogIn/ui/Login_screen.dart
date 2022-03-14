import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

import '../../../shared/constants/colors.dart';
import '../../base_widget.dart';
import '../controller/Login_screen_logic.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<LoginScreenController>(LoginScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.loginScreenleftPadding,
                      right: Dimensions.loginScreenrightPadding),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.TextSize50,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.loginScreenleftPadding,
                      right: Dimensions.loginScreenrightPadding),
                  child: Text(
                    'Self order kiosk Application',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: Dimensions.TextSize18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: Dimensions.SizedBoxValue70,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.loginScreenleftPadding + 40, right:Dimensions.padding100),
                  child: CustomTextField(name: 'Brand ID or Email', obscureValue: false),
                ),
                SizedBox(height: Dimensions.SizedBoxValue30,),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.loginScreenleftPadding + 40, right: Dimensions.padding100),
                  child: CustomTextField(name: 'Password', obscureValue: true),
                ),
                SizedBox(height: Dimensions.SizedBoxValue59,),
                InkWell(
                  onTap: (){
                    Get.to(HomeScreen());
                  },

                    child: Center(child:  CustomWidget.CustomButton(text: 'Submit'),))


              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField({required String name, required obscureValue}) {
    return TextFormField(
      obscureText: obscureValue,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(color: Colors.white,fontSize: Dimensions.TextSize18),
        contentPadding: EdgeInsets.only(top: 53),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.textFormFieldUnderlineColor),
        ),
      ),
    );
  }
}
