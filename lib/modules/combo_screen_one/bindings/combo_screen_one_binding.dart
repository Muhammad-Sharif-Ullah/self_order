import 'package:get/get.dart';

import '../controller/combo_screen_one_logic.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComboScreenController());
  }
}
