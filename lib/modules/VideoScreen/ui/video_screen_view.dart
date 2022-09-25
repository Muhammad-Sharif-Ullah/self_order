import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/shared/Route/route.dart';
import 'package:self_order/shared/constants/colors.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';

import '../controller/video_screen_logic.dart';

final image = "assets/images/orderhere.png";
final bgImage = "assets/images/5minw8.png";

class VideoScreenView extends GetView<VideoScreenController> {
  const VideoScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<VideoScreenController>(VideoScreenController());
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            physics: const ClampingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Image.asset(
                bgImage,
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            top: context.height * .16,
            left: 0,
            right: 0,
            child: Image.asset(
              image,
              height: 162.h,
              width: 232.w,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: context.height * .07,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .2.r),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.UserChoice,
                      arguments: PageRouteArguments(
                          data: [],
                          fromPage: AppRoutes.VideoScreen,
                          toPage: AppRoutes.UserChoice));
                },
                child: CustomWidget.CustomPrimaryButton(
                  titleFontWeight: FontWeight.w700,
                  borderradius: 100,
                  backgroundcolor: ColorConstants.videoScreenButtonColor,
                  titlecolor: Colors.white,
                  title: 'Tap to start',
                  height: 70.0.h,
                  width: MediaQuery.of(context).size.width * .3,
                  context: context,
                  borderColor: ColorConstants.videoScreenButtonColor,
                  titlefontSize: 18.sp,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: context.height * .16,
            left: 0,
            right: 0,
            child: Obx(() => DotsIndicator(
                  dotsCount: 3,
                  position: controller.currentIndex.value.toDouble(),
                  decorator: DotsDecorator(
                    size: Size(10.r, 10.r),
                    activeSize: Size(15.r, 15.r),
                    color: Colors.white, // Inactive color
                    activeColor: Colors.white,
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
