import 'package:get/get.dart';

import '../controller/banner_combo_controller.dart';

class BannerComboBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BannerComboController());
  }
}
