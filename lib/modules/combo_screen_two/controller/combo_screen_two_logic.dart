import 'package:get/get.dart';
import 'package:self_order/modules/ItemPage/controller/item_screen_logic.dart';
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

  var productTotal = 0.obs;

  List count = [3, 5, 8];

  var allComboList = [].obs;
  var comboList = [].obs;
  var styleList = [].obs;

  var comboTotal = 0.obs;

  var selectedStyle = {};

  setSelectedSize(String size) {
    selectedSize.value = size;
    if (currentStatus.value == 1) {
      getCombo();
    } else if (currentStatus.value == 2) {
      getSide();
    } else if (currentStatus.value == 3) {
      getDrinks();
    }
  }

  getAllCombo() {
    ItemScreenController item = Get.find();
    productTotal.value = item.product.value.productTotal;
    api.get(Routes.combo + '${selectedProductId.value}').then((value) {
      print(value);
      allComboList.value = value['combo'];
    });
  }

  getStyle() async {
    ItemScreenController controller = Get.find();
    print('style ${await controller.product.value.style}');
  }

  getCombo() {
    api
        .get(Routes.combo +
            '${selectedProductId.value}' +
            '/' +
            selectedSize.value)
        .then((value) {
      print(value);
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

  getTotal() {
    var total = 0;
    total += productTotal.value;
    total += (int.parse(selectedCombo['price'])) as int;
    total += (int.parse(selectedSide['price'])) as int;
    total += (int.parse(selectedDrink['price'])) as int;
    comboTotal.value = total;
  }

  checkOut() {}
}
