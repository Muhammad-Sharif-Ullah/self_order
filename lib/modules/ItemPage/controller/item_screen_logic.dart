import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:self_order/modules/ItemPage/model/MenuModel.dart';
import 'package:self_order/modules/ItemPage/model/ProductModel.dart';
import 'package:self_order/request/routes.dart';

import '../../../request/api_provider.dart';

const String topping = 'toppings';
const String style = 'style';
const String sauce = 'sauce';
const String soda = 'soda';
const String dressing = 'dressing';
const String side = 'side';
const String preparation = 'preparation';
const String extra = 'extra';
const String bacon = 'bacon';
const String meal = 'meal';
const String chrust = 'chrust';

class ItemScreenController extends GetxController {
  ApiProvider api = ApiProvider();
  @override
  void onInit() async {
    itemPageBanner();
  }

  /// Previous (Home Page) Page ID And Title
  RxString id = RxString('');
  RxString title = RxString('');

  /// For Action String
  RxBool isEatIn = true.obs;
  List extraFood = [1, 2, 3, 33, 3, 33, 3, 3, 3, 3, 3, 3, 3];

  /// RR
  ///
  var product = ProductModel().obs;

  /// This variable is for Bottom Sheet
  RxBool isOrderActive = false.obs;

  /// Sub Menu
  List<String> subMenu = [
    'Club Beef',
    "Club Beef",
    "XXL Blast",
    "Big Momoto",
    "Beef",
    "XXL Blast",
    "Chicken",
  ];
  RxInt selectedSubMeuIndex = RxInt(-1);

  /// Sub-SubMenu
  List<String> subSubMenu = [
    'Single patty',
    "Double patty",
    "Beef cheese",
    "Onion shoestrings",
    "Crispy bacon",
  ];
  RxInt selectedSubSubMeuIndex = RxInt(-1);

  /// selectedItem Index
  RxInt selectedItemIndex = RxInt(-1);
  var foods = [].obs;
  var banner = ''.obs;
  var subCategories = [].obs;
  var subSubCategories = [].obs;

  /// Selected Food Index
  RxInt selectedFoodIndex = RxInt(-1);

  ///
  itemPageBanner() async {
    await api.get(Routes.itemPageBanner).then((value) {
      log("itemPageBanner ${value.toString()}");
    });
  }

  getSubCategory(id) async {
    await api.get(Routes.productSubCategory + id).then((value) {
      subCategories.value = value['subcategory'];
      log("getSubCategory ${value['subcategory'].toString()}");
    });
  }

  getSubSubCategory(id) async {
    await api.get(Routes.productSubCategory + id).then((value) {
      subCategories.value = value['subcategory'];
      log("getSubSubCategory ${value['subcategory'].toString()}");
    });
  }

  var menu = Product().obs;
  getFood(index) {
    menu.value = Product.fromJson(foods[index]);
  }

  /// For Dialog Selector
  RxMap<String, List> dialogItemsSelector = {
    topping: [],
    style: [],
    sauce: [],
    soda: [],
    dressing: [],
    side: [],
    preparation: [],
    extra: [],
    bacon: [],
    meal: [],
    chrust: [],
  }.obs;

  /// clear Selector
  clearItemsSelector() {
    dialogItemsSelector = {
      topping: [],
      style: [],
      sauce: [],
      soda: [],
      dressing: [],
      side: [],
      preparation: [],
      extra: [],
      bacon: [],
      meal: [],
      chrust: [],
    }.obs;
  }

  updateList() {
    update();
  }

  getFoods(id) {
    api.get(Routes.productCategory + id).then((value) {
      foods.value = value['product'] ?? [];
      log(value.toString());
    });
  }

  var customiseFoods = [].obs;
  var customiseExtraFoods = [].obs;
  getCustomiseFood(id) async {
    print('customise id is $id');
    await api.get(Routes.customiseProduct + '1').then((value) {
      print(jsonEncode(value));
      customiseFoods.value = value['customise'] ?? [];
    });
  }

  getCustomiseExtra(id) {
    api.get(Routes.customiseExtra + '22').then((value) {
      // customiseExtraFoods.value = value['product'];
    });
  }

  clearAllCache() {
    id = RxString('');
    title = RxString('');
    isOrderActive = false.obs;
    selectedSubMeuIndex = RxInt(-1);
    selectedSubSubMeuIndex = RxInt(-1);
    selectedItemIndex = RxInt(-1);
    foods = [].obs;
    banner = ''.obs;
    subCategories = [].obs;
    subSubCategories = [].obs;
    selectedFoodIndex = RxInt(-1);
    menu = Product().obs;
    clearItemsSelector();
  }

  cancelOrderActionCleanCache() {
    // id = RxString('');
    // title = RxString('');
    isOrderActive = false.obs;
    selectedSubMeuIndex = RxInt(-1);
    selectedSubSubMeuIndex = RxInt(-1);
    selectedItemIndex = RxInt(-1);
    selectedFoodIndex = RxInt(-1);
    clearItemsSelector();
  }

  productTotal() {
    var total = product.value.productPrice;
    total += (product.value.selectedChrustId != null)
        ? product.value.chrust[product.value.selectedChrustId!].price
        : 0;
    total += (product.value.selectedStyleId != null)
        ? product.value.style[product.value.selectedStyleId!].price
        : 0;
    total += (product.value.selectedPreparationId != null)
        ? product.value.meal[product.value.selectedPreparationId!].price
        : 0;
    total += (product.value.selectedMealId != null)
        ? product.value.meal[product.value.selectedPreparationId!].price
        : 0;

    // multi select
    // product.value.toppings.forEach((element) {
    //   if (element.selected == true) {
    //     total += element.price;
    //   }
    // });
    product.value.sauce.forEach((element) {
      if (element.selected == true) {
        total += element.price;
      }
    });
    product.value.soda.forEach((element) {
      if (element.selected == true) {
        total += element.price;
      }
    });
    product.value.side.forEach((element) {
      if (element.selected == true) {
        total += element.price;
      }
    });
    product.value.extra.forEach((element) {
      if (element.selected == true) {
        total += element.price;
      }
    });
    product.value.bacon.forEach((element) {
      if (element.selected == true) {
        total += element.price;
      }
    });
    print('total $total');
    return total;
  }
}
