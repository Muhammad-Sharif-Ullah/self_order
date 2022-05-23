import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/combo_screen_one/ui/combo_screen_one_view.dart';
import '../../../shared/constants/Dimensions.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/customWidget_utils.dart';
import 'item_customise_page.dart';
import 'item_customise_page.dart';

uerChoiceDialog(
    {required BuildContext context,
    required String heading,
    required String subHeading,
    required String price}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ), //this right here
          child: Container(
            height: 530.h,
            width: 656.w,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.SizedBoxValue30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      Text(
                        'Make your choice',
                        style: TextStyle(
                            color: ColorConstants.primaryButtonColor,
                            fontSize: 30.sp),
                      ),
                      Spacer(),
                      CustomWidget.CustomCloseSection(context: context),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.w),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/item.png",
                        ),
                        height: 158.h,
                        width: 212.w,
                      ),
                      SizedBox(width: 30.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            heading,
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            subHeading,
                            style: TextStyle(
                                color: ColorConstants.primaryBigTextColor
                                    .withOpacity(0.5),
                                fontSize: 30.sp),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            price,
                            style: TextStyle(
                                color: ColorConstants.bannerHeadingTextColor
                                    .withOpacity(0.5),
                                fontSize: 30.sp),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Get.to(ComboScreenViewOne()),
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            height: 60.h,
                            width: 282.w,
                            borderColor: ColorConstants.priceborderColor,
                            title: 'Make it combo',
                            titlecolor: Colors.white,
                            titlefontSize: 24.sp,
                            borderradius: 5,
                            backgroundcolor: ColorConstants.priceborderColor,
                            titleFontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/itemcustomisePage',
                              arguments: PageRouteArguments(
                                  data: [],
                                  fromPage: 'itempage',
                                  toPage: 'itemcustomisePage'));
                        },
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            height: 60.h,
                            width: 282.w,
                            borderColor: ColorConstants.bannerHeadingTextColor,
                            title: 'Customise',
                            titlecolor: Colors.white,
                            titlefontSize: 24.sp,
                            borderradius: 5,
                            backgroundcolor:
                                ColorConstants.bannerHeadingTextColor,
                            titleFontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomWidget.CustomPrimaryButton(
                    context: context,
                    height: 60.h,
                    width: 596.w,
                    borderColor: ColorConstants.primaryButtonColor,
                    title: 'Add to cart',
                    titlecolor: Colors.white,
                    titlefontSize: 24.sp,
                    borderradius: 5,
                    backgroundcolor: ColorConstants.primaryButtonColor,
                    titleFontWeight: FontWeight.w700),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        );
      });
}
