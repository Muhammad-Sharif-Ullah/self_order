import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:self_order/modules/UserChoice/ui/userchoice_screen_view.dart';
import 'package:self_order/shared/constants/Dimensions.dart';
import 'package:self_order/shared/utils/customWidget_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../shared/constants/colors.dart';
import '../../base_widget.dart';
import '../controller/video_screen_logic.dart';

class VideoScreenView extends GetView<VideoScreenController> {
  const VideoScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<VideoScreenController>(VideoScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  height: Get.height,
                  child: Image(
                    image: AssetImage("assets/images/5minw8.png"),
                    fit: BoxFit.fitHeight,
                  )),
              Positioned(
                bottom: Dimensions.SizedBoxValue100,
                child: InkWell(
                  onTap: () {
                    Get.to(UserChoiceScreen(),transition: Transition.fade);
                  },
                  child: CustomWidget.CustomButton(
                      color: ColorConstants.videoScreenButtonColor,
                      text: 'Tap to Start'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
