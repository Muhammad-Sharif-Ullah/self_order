import 'package:get/get.dart';

import '../controller/payment_screen_logic.dart';

class PaymentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentScreenController());
  }
}
