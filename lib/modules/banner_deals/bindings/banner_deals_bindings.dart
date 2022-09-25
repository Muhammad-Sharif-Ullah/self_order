import 'package:get/get.dart';

import '../controller/banner_deals_controller.dart';

class BannerDealsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BannerDealsController());
  }
}
