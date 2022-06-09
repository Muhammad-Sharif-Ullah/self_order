import 'package:get/get.dart';
import 'package:self_order/request/api_provider.dart';

import '../../../request/routes.dart';

class HomeScreenController extends GetxController {
  ApiProvider api = ApiProvider();
  RxInt selectedItemColor = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getSliders();
    getBanners();
    getCategories();
    getCustomerChoice();
  }

  final sliders = [].obs;
  final banners = [].obs;
  final categories = [].obs;
  final customerChoices = [].obs;

  getSliders() {
    api.get(Routes.homePageSlider).then((value) {
      sliders.value = value['home_page_slider'];
      print(sliders.value);
    });
  }

  getBanners() {
    api.get(Routes.homePageBanner).then((value) {
      banners.value = value['home_page_banner'];
    });
  }

  getCategories() {
    api.get(Routes.category + '/E').then((value) {
      print(value);
      categories.value = value['category'];
    });
  }

  getCustomerChoice() {
    api.get(Routes.customerChoice).then((value) {
      customerChoices.value = value['customer_choice'];
    });
  }
}
