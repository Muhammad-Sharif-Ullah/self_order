import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

class ComboCart extends StatefulWidget {
  const ComboCart({Key? key}) : super(key: key);

  @override
  State<ComboCart> createState() => _ComboCartState();
}

class _ComboCartState extends State<ComboCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
                    fontSize: Dimensions.TextSize50,
                    color: ColorConstants.primaryButtonColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CustomWidget.CustomOrderView(),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.sp, right: 30.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CustomWidget.CustomPrimaryButton(
                            context: context,
                            height: 60.h,
                            width: 282.w,
                            titlecolor: Color(0xFFFF000E),
                            borderColor: Color(0xFFFF000E),
                            backgroundcolor: Colors.transparent,
                            title: 'Cancel combo',
                            titlefontSize: 24.sp,
                            borderradius: 5,
                            titleFontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CustomWidget.CustomPrimaryButton(
                          context: context,
                          height: 60.h,
                          width: 282.w,
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
                    height: 20.sp,
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
