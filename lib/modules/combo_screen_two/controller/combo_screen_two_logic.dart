import 'package:get/get.dart';
import 'package:self_order/request/api_provider.dart';
import '../../../request/routes.dart';

class ComboScreenControllertwo extends GetxController {
  ApiProvider api = ApiProvider();

  var currentStatus = 1.obs;

  var selectedProductId = ''.obs;
  var selectedSize = ''.obs;

  var selectedComboId = ''.obs;
  var selectedCombo = {}.obs;

  var selectedSideId = ''.obs;
  var selectedSide = {}.obs;

  var selectedDrinkId = ''.obs;
  var selectedDrink = {}.obs;

  dynamic selectedFoodVersion = ''.obs;

  List count = [3, 5, 8];

  var comboList = [].obs;
  getCombo() {
    api
        .get(Routes.combo +
            '${selectedProductId.value}' +
            '/' +
            selectedSize.value)
        .then((value) {
      comboList.value = value['combo'];
    });
  }

  var comboChoices = [].obs;
  getComboChoices() {}

  var sideList = [].obs;
  getSide() {
    api
        .get(
            Routes.comboSide + selectedComboId.value + '/' + selectedSize.value)
        .then((value) {
      print(value);
      sideList.value = value['comboside'];
    });
  }

  var drinkList = [].obs;
  getDrinks() {
    api
        .get(Routes.comboDrink + selectedComboId.value + '/${selectedSize}')
        .then((value) {
      print(value);
      drinkList.value = value['combodrink'];
    });
  }
}
