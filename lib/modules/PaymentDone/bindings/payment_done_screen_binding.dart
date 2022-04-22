import 'package:get/get.dart';
import '../controller/payment_done_screen_logic.dart';

class PaymentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentDoneScreenController());
  }
}
