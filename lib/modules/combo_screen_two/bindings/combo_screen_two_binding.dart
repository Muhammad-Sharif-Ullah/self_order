import 'package:get/get.dart';

import '../controller/combo_screen_two_logic.dart';

class ComboScreenBindingTwo extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComboScreenControllertwo());
  }
}
