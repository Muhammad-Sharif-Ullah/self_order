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

  // get all sub category
  var categoryId = ''.obs;
  getSubCategory(id) {
    categoryId.value = id;
    api.get(Routes.getSubCategory + id).then((value) {
      subCategories.value = value['subcategory'];
    });
  }

  //  Category wise product
  getCategoryWiseProduct(id) {
    api.get(Routes.categoryWiseProduct + id).then((value) {
      foods.value = value['product'];
    });
  }

  //  Category Sub Category wise product
  getCategorySubCategoryWiseProduct(id) {
    foods.value = [];
    api
        .get(
            Routes.categorySubCategoryWiseProduct + id + '/' + categoryId.value)
        .then((value) {
      foods.value = value['product'];
    });
  }

  /*
  * get single product detail
  */
  var menu = {}.obs;
  var style = [].obs;
  getFood(index) {
    menu.value = foods[index];
    style.value = foods[index]['style'];
  }

  /*
  *  Customise Products
  */
  var customiseFoods = [].obs;
  var customiseExtraFoods = [].obs;
  var customiseExtraOptions = [].obs;
  getCustomiseFood(id) {
    api.get(Routes.customiseProduct + '246').then((value) {
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
