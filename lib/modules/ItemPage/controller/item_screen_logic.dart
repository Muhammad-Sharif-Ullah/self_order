import 'package:get/get.dart';
import 'package:self_order/modules/Home/controller/home_screen_logic.dart';
import 'package:self_order/modules/ItemPage/model/CustomiseExtraProduct.dart';
import 'package:self_order/modules/ItemPage/model/CustomiseOption.dart';
import 'package:self_order/modules/ItemPage/model/ProductModel.dart';
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
  var categories = [].obs;
  var subCategories = [].obs;
  var subSubCategories = [].obs;

  var categoryId = ''.obs;
  var subCategoryId = ''.obs;
  var subSubCategoryId = ''.obs;

  itemPageBanner() {
    api.get(Routes.itemPageBanner).then((value) {
      print(value);
    });
  }

  /*
    category and category wise product
  */
  getMainCategory() {
    HomeScreenController controller = Get.find();
    categories.value = controller.categories.value;
  }

  getCategoryWiseProduct(id) {
    foods.value = [];
    api.get(Routes.categoryWiseProduct + id).then((value) {
      foods.value = value['product'];
    });
  }

  /*
   get all sub category and sub category wise product
  */
  getSubCategory(id) {
    categoryId.value = id;
    api.get(Routes.getSubCategory + id).then((value) {
      subCategories.value = value['subcategory'];
    });
    getCategorySubCategoryWiseProduct(id);
  }

  getCategorySubCategoryWiseProduct(id) {
    foods.value = [];
    subCategoryId.value = id;
    api
        .get(
            Routes.categorySubCategoryWiseProduct + categoryId.value + '/' + id)
        .then((value) {
      print(value);
      print('categorySubCategoryWiseProduct');
      foods.value = value['product'];
    });
  }

  // sub category and sub sub category wise product
  getSubSubCategory(id) {
    subCategoryId.value = id;
    subSubCategoryId.value = '';
    subSubCategories.value = [];
    api.get(Routes.subcatsubsubcat + id).then((value) {
      print(value);
      subSubCategories.value = value['product'];
      getCategorySubCategoryWiseProduct(id);
    });
  }

  subSubCatProduct(id) {
    subSubCategoryId.value = id;
    foods.value = [];
    api
        .get(Routes.subcatsubsubcatWiseProduct +
            categoryId.value +
            '/' +
            subCategoryId.value +
            '/' +
            id)
        .then((value) {
      print(value);
      print('sub sub cat product');
      foods.value = value['product'];
    });
  }

  /*
  * get single product detail
  */
  var menu = {}.obs;
  var product = ProductModel().obs;
  getFood(index) {
    menu.value = foods[index];
    product.value = ProductModel.fromJson(foods[index]);
  }

  setCustomerChoiceFood(food) {
    product.value = ProductModel.fromJson(food);
  }

  /*
  *  Customise Products
  */
  var customiseExtra = CustomiseExtraProduct().obs;
  var customiseProduct = CustomiseProduct().obs;
  getCustomiseFood(id) {
    api.get(Routes.customiseProduct + id).then((value) {
      customiseProduct.value = CustomiseProduct.fromJson(value);
    });
  }

  getCustomiseExtraOption(id) {
    api.get(Routes.customiseExtra + id).then((value) {
      customiseExtra.value = CustomiseExtraProduct.fromJson(value);
    });
  }
}
