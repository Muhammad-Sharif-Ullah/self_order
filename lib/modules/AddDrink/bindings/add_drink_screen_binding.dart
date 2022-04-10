import 'package:get/get.dart';

import '../controller/add_drink_screen_logic.dart';

class AddDrinkScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDrinkScreenController());
  }
}
