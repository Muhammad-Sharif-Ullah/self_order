import 'package:get/get.dart';

import '../controller/Login_screen_logic.dart';


class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
}
