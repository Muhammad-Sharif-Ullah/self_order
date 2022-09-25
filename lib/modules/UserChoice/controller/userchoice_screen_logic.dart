import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/shared/Route/route.dart';

class UserChoiceController extends GetxController {
  RxBool isEatIn = false.obs;
  var userChoice = ''.obs;

  setUserChoice(value) {
    userChoice.value = value;
    if (value == "E") {
      isEatIn.value = true;
    } else {
      isEatIn.value = false;
    }
    Navigator.pushNamed(Get.context!, AppRoutes.HomeScreen,
        arguments: PageRouteArguments(
            data: [],
            toPage: AppRoutes.HomeScreen,
            fromPage: AppRoutes.UserChoice));
  }

  getUserChoice() {
    return userChoice.value;
  }
}
