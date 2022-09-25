import 'package:get/get.dart';

import '../controller/home_screen_logic.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
