import 'package:get/get.dart';
import 'package:self_order/request/api_provider.dart';
import '../../../request/routes.dart';

class ComboScreenControllertwo extends GetxController {
  ApiProvider api = ApiProvider();

  var currentStatus = 1.obs;

  var selectedCombo = '18'.obs;
  var selectedSize = 'm'.obs;

  dynamic selectedFoodVersion = ''.obs;

  List count = [3, 5, 8];

  var comboList = [].obs;
  getCombo() {
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

  var comboChoices = [].obs;
  getComboChoices() {}

  var sideList = [].obs;
  getSide(id) {
    api
        .get(Routes.comboSide + selectedCombo.value + '/' + selectedSize.value)
        .then((value) {
      print(value);
      sideList.value = value['comboside'];
    });
  }

  var drinkList = [].obs;
  getDrinks() {
    api
        .get(Routes.comboDrink + '18/m'
            // +
            // selectedCombo.value +
            // '/' +
            // selectedSize.value
            )
        .then((value) {
      print(value);
      drinkList.value = value['combodrink'];
    });
  }
}
