import 'package:get/get.dart';
import 'package:self_order/modules/ItemPage/model/MenuModel.dart';
import 'package:self_order/request/routes.dart';

import '../../../request/api_provider.dart';

class ItemScreenController extends GetxController {
  ApiProvider api = ApiProvider();
  @override
  void onInit() async {
    itemPageBanner();
  }

  List extraFood = [1, 2, 3, 33, 3, 33, 3, 3, 3, 3, 3, 3, 3];

  var foods = [].obs;
  var banner = ''.obs;
  var subCategories = [].obs;
  var subSubCategories = [].obs;

  itemPageBanner() {
    api.get(Routes.itemPageBanner).then((value) {
      print(value);
    });
  }

  getSubCategory(id) {
    api.get(Routes.productSubCategory + id).then((value) {
      subCategories.value = value['subcategory'];
    });
  }

  getSubSubCategory(id) {
    api.get(Routes.productSubCategory + id).then((value) {
      subCategories.value = value['subcategory'];
    });
  }

  var menu = {}.obs;
  var style = [].obs;
  getFood(index) {
    menu.value = foods[index];
    style.value = foods[index]['style'];
  }

  getFoods(id) {
    api.get(Routes.productCategory + id).then((value) {
      foods.value = value['product'];
    });
  }

  var customiseFoods = [].obs;
  var customiseExtraFoods = [].obs;
  var customiseExtraOptions = [].obs;
  getCustomiseFood(id) {
    api.get(Routes.customiseProduct + '246').then((value) {
      print(value);
      customiseFoods.value = value['customise'];
    });
  }

  getCustomiseExtra(id) {
    api.get(Routes.customiseExtra + '22').then((value) {
      customiseExtraFoods.value = value['customiseextra'];
    });
  }

  getCustomiseExtraOption(id) {
    api.get(Routes.customiseExtra + '34').then((value) {
      customiseExtraOptions.value = value['customise_extra_options'];
    });
  }
}
