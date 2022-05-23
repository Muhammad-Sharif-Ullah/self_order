import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/modules/VideoScreen/ui/video_screen_view.dart';
import 'package:self_order/routes/app_routes.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

import '../../../Data/Model/page_route_arguments.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/theme/theme_service.dart';
import '../../base_widget.dart';
import '../controller/Login_screen_logic.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Get.put<LoginScreenController>(LoginScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Container(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 165.w),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontSize: Dimensions.TextSize50,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.SizedBoxValue10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 165.w),
                    child: Text(
                      'Self order kiosk Application',
                      style: TextStyle(
                          color:
                              ThemeService().getThemeMode() == ThemeMode.light
                                  ? ColorConstants.secondaryTextColor
                                      .withOpacity(0.5)
                                  : ColorConstants.secondaryTextColor
                                      .withOpacity(0.5),
                          fontSize: Dimensions.TextSize18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.SizedBoxValue70,
                  ),
                  SizedBox(
                      width: 500,
                      child: Padding(
                        padding: EdgeInsets.only(left: 165.w),
                        child: CustomWidget.customTextField(
                          context: context,
                          horizontalPadding: 20,
                          name: 'email',
                          obscureText: false,
                          labelText: 'Brand ID or Email',
                          borderColor: ColorConstants.bannerPrimaryColor,
                          helperTextColor: ColorConstants.primaryButtonColor,
                          helperTextFontSize: 18.sp,
                        ),
                      )),
                  SizedBox(
                    height: Dimensions.SizedBoxValue30,
                  ),

                  SizedBox(
                      width: 500,
                      child: Padding(
                        padding: EdgeInsets.only(left: 165.w),
                        child: CustomWidget.customTextField(
                          context: context,
                          horizontalPadding: 20,
                          name: 'pass',
                          obscureText: true,
                          labelText: 'Password',
                          borderColor: ColorConstants.bannerPrimaryColor,
                          helperTextColor: ColorConstants.primaryButtonColor,
                          helperTextFontSize: 18.sp,
                        ),
                      )),
                  // Padding(
                  //   padding: EdgeInsets.only(left: Dimensions.loginScreenleftPadding + 40, right: Dimensions.padding100),
                  //   child: CustomTextField(name: 'Password', obscureValue: true, context: context),
                  // ),
                  SizedBox(height: 95.h),
                  InkWell(
                      onTap: () {
                        controller.login(
                            _formKey.currentState?.fields['email']?.value,
                            _formKey.currentState?.fields['pass']?.value);
                      },
                      child: Center(
                          child: CustomWidget.CustomPrimaryButton(
                              borderColor: ColorConstants.primaryButtonColor,
                              context: context,
                              width: 170.w,
                              height: 60.h,
                              title: 'Submit',
                              titlefontSize: 18.sp,
                              titlecolor: Colors.white,
                              backgroundcolor:
                                  ColorConstants.primaryButtonColor,
                              borderradius: 100,
                              titleFontWeight: FontWeight.w700)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField(
      {required String name,
      required obscureValue,
      required BuildContext context}) {
    return TextFormField(
      obscureText: obscureValue,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: Dimensions.TextSize18),
        contentPadding: EdgeInsets.only(top: 53),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstants.textFormFieldUnderlineColor),
        ),
      ),
    );
  }
}
