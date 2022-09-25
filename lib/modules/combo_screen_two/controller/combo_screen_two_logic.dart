import 'package:get/get.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
import 'package:self_order/request/api_provider.dart';

import '../../../request/routes.dart';

class ComboScreenControllertwo extends GetxController {
  ApiProvider api = ApiProvider();
  @override
  void onInit() async {}
  var selectedProductId = ''.obs;

  var selectedCombo = '18'.obs;
  var selectedSize = 'm'.obs;

  /// From Requirement Repo
  var itemIndex = 3.obs;
  var comboVariations = [].obs;
  var combos = [].obs;
  var allComboList = [].obs;
  var productTotal = 0.obs;

  index(id) {
    api.get(Routes.combo + id.toString()).then((value) {
      combos.value = value['combo'];
    });
  }

  //  End
  Map<String, String> comboSelection = <String, String>{
    "s": "Small Combo",
    "m": "Medium Combo",
    "l": "Large Combo",
    // "el": "Extra Large Combo",
  };

  List<String> comboSectionImage = [
    "assets/images/small_type.png",
    "assets/images/medium_type.png",
    "assets/images/large_type.png",
    // "assets/images/large_type.png"
  ];
  dynamic selectedFoodVersion = ''.obs;

  List count = [];

  var comboList = [].obs;
  getCombo() {
    print('selected combo is ${selectedCombo.value}');
    api
        .get(Routes.combo +
            '/246' +
            // selectedCombo.toString() +
            '/' +
            selectedSize.value)
        .then((value) {
      comboList.value = value['combo'];
    });
  }

  var sideList = [].obs;
  getSide() {
    api
        .get(Routes.comboSide +
            '/' +
            selectedCombo.value +
            '/' +
            selectedSize.value)
        .then((value) {
      sideList.value = value['comboside'];
    });
  }

  var drinkList = [].obs;
  getDrinks() {
    api
        .get(Routes.comboDrink +
            '/' +
            selectedCombo.value +
            '/' +
            selectedSize.value)
        .then((value) {
      drinkList.value = value['combodrink'];
    });
  }

  getAllCombo() {
    ItemScreenController item = Get.find();
    productTotal.value = item.product.value.productTotal;
    api.get(Routes.combo + '${selectedProductId.value}').then((value) {
      print(value);
      allComboList.value = value['combo'];
    });
  }
}
