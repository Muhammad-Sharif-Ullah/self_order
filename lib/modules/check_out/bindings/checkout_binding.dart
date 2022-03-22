import 'package:get/get.dart';

import '../controller/check_out_logic.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}
