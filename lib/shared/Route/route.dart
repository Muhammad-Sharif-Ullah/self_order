import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:self_order/modules/ItemPage/ui/item_screen_view.dart';
import 'package:self_order/modules/UserChoice/ui/userchoice_screen_view.dart';
import 'package:self_order/modules/payment/ui/payment_screen_view.dart';

import '../../modules/Home/ui/home_screen_view.dart';
import '../../modules/ItemPage/ui/item_customise_page.dart';
import '../../modules/LogIn/ui/Login_screen.dart';
import '../../modules/VideoScreen/ui/video_screen_view.dart';
import '../../modules/check_out/ui/check_out_view.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings? route) {
    switch (route!.name) {
      case '/':
        return PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.fade,
        );

      case '/videoscreen':
        return PageTransition(
          child: VideoScreenView(),
          type: PageTransitionType.fade,
        );

      case '/userchoicescreen':
        return PageTransition(
          child: UserChoiceScreen(),
          type: PageTransitionType.fade,
        );

      case '/homescreen':
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.fade,
        );

      // case '/itempagescreen':
      //   return PageTransition(
      //     child: ItemPageScreen(),
      //     type: PageTransitionType.fade,
      //   );

      case '/itemcustomisePage':
        return PageTransition(
          child: ItemCustomisePage(),
          type: PageTransitionType.fade,
        );

      case '/checkoutPage':
        return PageTransition(
          child: CheckoutScreen(),
          type: PageTransitionType.fade,
        );

      case '/paymentscreen':
        return PageTransition(
          child: PaymentScreen(),
          type: PageTransitionType.fade,
        );

      default:
        return null;
    }
  }
}
