import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/Model/page_route_arguments.dart';

class UserChoiceController extends GetxController {
  var userChoice = ''.obs;

  setUserChoice(value) {
    userChoice.value = value;
    Navigator.pushNamed(Get.context!, '/homescreen',
        arguments: PageRouteArguments(
            data: [], toPage: 'homescreen', fromPage: 'userchoicescreen'));
  }

  getUserChoice() {
    return userChoice.value;
  }
}
