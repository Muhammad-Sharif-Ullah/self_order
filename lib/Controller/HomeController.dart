import 'package:get/get.dart';
import 'package:self_order/request/api_provider.dart';

import '../request/routes.dart';

class HomeController extends GetxController {
  ApiProvider api = ApiProvider();

  final orderType = ''.obs;
  final sliders = [].obs;
  final banners = [].obs;
  final categories = [].obs;

  setOrderTypoe(type) {
    orderType.value = type;
  }

  getSliders() async {
    final response = await api.get(Routes.slider);
    print(response);
  }
}
