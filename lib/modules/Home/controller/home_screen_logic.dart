import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var orderType = ''.obs;
  RxInt selectedItemColor = 0.obs;

  setOrderType(type) {
    print(type);
    orderType.value = type;
  }
}
