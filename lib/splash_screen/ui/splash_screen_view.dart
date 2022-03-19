import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../modules/base_widget.dart';
import '../../shared/constants/colors.dart';
import '../controller/splash_screen_logic.dart';

class SplashScreen extends GetView<SplashScreenController>{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<SplashScreenController>(SplashScreenController());
    return BaseWidget(
      builder: (context, sizingInformation) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
       
      ),
    );
  }


}