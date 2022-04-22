import 'package:get/get.dart';

import '../controller/item_screen_logic.dart';

class ItemScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemScreenController());
  }
}
