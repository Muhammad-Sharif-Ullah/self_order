import 'package:get/get.dart';

import '../controller/add_side_screen_logic.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSidesScreenController());
  }
}
