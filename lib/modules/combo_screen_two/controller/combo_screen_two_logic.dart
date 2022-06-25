import 'package:get/get.dart';
import 'package:self_order/request/api_provider.dart';
import '../../../request/routes.dart';

class ComboScreenControllertwo extends GetxController {
  ApiProvider api = ApiProvider();
  @override
  void onInit() async {}

  var selectedCombo = '18'.obs;
  var selectedSize = 'm'.obs;

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
}
