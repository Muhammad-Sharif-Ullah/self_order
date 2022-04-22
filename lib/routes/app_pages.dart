import 'package:get/get.dart';
import 'package:self_order/modules/Home/bindings/home_screen_binding.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/modules/LogIn/bindings/Login_screen_binding.dart';
import 'package:self_order/modules/LogIn/ui/Login_screen.dart';
import 'package:self_order/modules/check_out/bindings/checkout_binding.dart';
import 'package:self_order/modules/check_out/ui/check_out_view.dart';
import '../modules/UserChoice/bindings/userchoice_screen_binding.dart';
import '../modules/UserChoice/ui/userchoice_screen_view.dart';
import '../modules/VideoScreen/bindings/video_screen_binding.dart';
import '../modules/VideoScreen/ui/video_screen_view.dart';
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
    ),
    GetPage(
      name: Routes.VideoScreen,
      page: () => VideoScreenView(),
      binding: VideoScreenBinding(),
    ),
    GetPage(
      name: Routes.VideoScreen,
      page: () => VideoScreenView(),
      binding: VideoScreenBinding(),
    ),
    GetPage(
      name: Routes.UserChoice,
      page: () => UserChoiceScreen(),
      binding: UserChoiceBinding(),
    ),
    GetPage(
      name: Routes.Checkout,
      page: () => CheckoutScreen(),
      binding: CheckoutBinding(),
    ),
  ];
}
