import 'package:get/get.dart';

import '../controller/video_screen_logic.dart';

class VideoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoScreenController());
  }
}
