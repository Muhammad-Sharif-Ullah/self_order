import 'package:get/get.dart';

import '../controller/userchoice_screen_logic.dart';

class UserChoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserChoiceController());
  }
}
