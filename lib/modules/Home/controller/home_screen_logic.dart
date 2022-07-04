import 'package:get/get.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/modules/ItemPage/ui/user_choice_dialog.dart';
import 'package:self_order/modules/UserChoice/controller/userchoice_screen_logic.dart';
import 'package:self_order/request/api_provider.dart';

import '../../../request/routes.dart';

class HomeScreenController extends GetxController {
  ApiProvider api = ApiProvider();
  RxInt selectedItemColor = 0.obs;
  var userChoice = ''.obs;

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
    print('user choice' + userChoice.value);
    api.get(Routes.category + '/${userChoice.value}').then((value) {
      print(value);
      categories.value = value['category'];
    });
  }

  getCustomerChoice() {
    api.get(Routes.customerChoice).then((value) {
      customerChoices.value = value['customer_choice'];
    });
  }

  selectCustomerChoice(index) {
    // print('select customer choice' + index.toString());
    // ItemScreenController itemScreenController = Get.find();
    // itemScreenController.setCustomerChoiceFood(customerChoices.value[index]);
    // userChoiceDialog(context: Get.context!);
  }
}
