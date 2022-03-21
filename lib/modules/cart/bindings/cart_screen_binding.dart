import 'package:get/get.dart';

import '../controller/cart_screen_logic.dart';

class CartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartScreenController());
  }
}
