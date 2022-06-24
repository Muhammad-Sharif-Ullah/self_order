import 'package:get/get.dart';
import 'package:self_order/request/api_provider.dart';
import 'package:self_order/routes/app_routes.dart';

class ComboScreenController extends GetxController {
  ApiProvider api = ApiProvider();

  var itemIndex = 3.obs;
  var comboVariations = [].obs;
  var combos = [].obs;

  index(id) {
    api.get(Routes.Combo + id.toString()).then((value) {
      combos.value = value['combo'];
    });
  }
}
