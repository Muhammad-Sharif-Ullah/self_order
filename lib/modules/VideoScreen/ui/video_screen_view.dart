import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/UserChoice/ui/userchoice_screen_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../shared/constants/colors.dart';
import '../../base_widget.dart';
import '../controller/video_screen_logic.dart';
import 'package:dots_indicator/dots_indicator.dart';

class VideoScreenView extends GetView<VideoScreenController> {
  const VideoScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<VideoScreenController>(VideoScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
        // body: Container(
        //   child: Stack(
        //     alignment: Alignment.bottomCenter,
        //     children: [
        //       SizedBox(
        //         height: Get.height,
        //         child: Image(
        //           image: AssetImage("assets/images/5minw8.png"),
        //           fit: BoxFit.fitHeight,
        //         ),
        //       ),
        //       Positioned(
        //         bottom: Dimensions.SizedBoxValue100,
        //         child: InkWell(
        //           onTap: () {
        //             Get.to(UserChoiceScreen(), transition: Transition.fade);
        //           },
        //           child: CustomWidget.CustomButton(
        //               color: ColorConstants.videoScreenButtonColor,
        //               text: 'Tap to Start'),
        //         ),
        //       ),
        //       Positioned(
        //         top: 150.h,
        //         child: DotsIndicator(
        //           dotsCount: 4,
        //           position: 1,
        //           decorator: DotsDecorator(
        //             color: Colors.red, // Inactive color
        //             activeColor: Colors.white,
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //           top: 114,
        //           child: Image(
        //             image: AssetImage("assets/images/orderhere.png"),
        //             height: 162,
        //             width: 232,
        //           )),
        //
        //     ],
        //   ),
        // ),

        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/5minw8.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              SizedBox(
                height: 114.h,
              ),
              Image(
                image: AssetImage("assets/images/orderhere.png"),
                height: 162.h,
                width: 232.w,
              ),
              Spacer(),
              DotsIndicator(
                dotsCount: 5,
                position: 1,
                decorator: DotsDecorator(
                  color: Colors.white, // Inactive color
                  activeColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/userchoicescreen',
                      arguments: PageRouteArguments(
                          data: [],
                          fromPage: 'VideoScreenPage',
                          toPage: 'userChoiceScreen'));
                },
                child: CustomWidget.CustomPrimaryButton(
                  titleFontWeight: FontWeight.w700,
                  borderradius: 100,
                  backgroundcolor: ColorConstants.videoScreenButtonColor,
                  titlecolor: Colors.white,
                  title: 'Tap to start',
                  height: 60.0.h,
                  width: 170.0.w,
                  context: context,
                  borderColor: ColorConstants.videoScreenButtonColor,
                  titlefontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
