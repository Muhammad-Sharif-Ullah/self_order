import 'package:get/get.dart';
import 'package:self_order/modules/UserChoice/controller/userchoice_screen_logic.dart';
import 'package:self_order/request/api_provider.dart';

import '../../../request/routes.dart';

class HomeScreenController extends GetxController {
  ApiProvider api = ApiProvider();
  RxInt selectedItemColor = 0.obs;
  var userChoice = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserChoice();
    getSliders();
    getBanners();
    getCategories();
    getCustomerChoice();
  }

  final sliders = [].obs;
  final banners = [].obs;
  final categories = [].obs;
  final customerChoices = [].obs;

  getUserChoice() {
    UserChoiceController controller = Get.find();
    userChoice.value = controller.getUserChoice();
  }

  Future<void> getSliders() async {
    isLoading.value = true;
    await api.get(Routes.homePageSlider).then((value) {
      sliders.value = value['home_page_slider'];
      print(sliders.value);
      isLoading.value = false;
    });
  }

  Future<void> getBanners() async {
    isLoading.value = true;
    await api.get(Routes.homePageBanner).then((value) {
      banners.value = value['home_page_banner'];
      isLoading.value = false;
    });
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    print('user choice' + userChoice.value);
    await api.get(Routes.category + '/${userChoice.value}').then((value) {
      print(value);
      categories.value = value['category'];
      isLoading.value = false;
    });
  }

  Future<void> getCustomerChoice() async {
    isLoading.value = true;
    await api.get(Routes.customerChoice).then((value) {
      customerChoices.value = value['customer_choice'];
      isLoading.value = false;
    });
  }
}
