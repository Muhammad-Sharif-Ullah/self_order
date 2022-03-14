import 'package:get/get.dart';
import 'package:self_order/modules/Home/bindings/home_screen_binding.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/modules/LogIn/bindings/Login_screen_binding.dart';
import 'package:self_order/modules/LogIn/ui/Login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.Login;

  static final routes = [
    GetPage(
      name: Routes.Login,
      page: () => LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: Routes.HomeScreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    )
  ];
}
