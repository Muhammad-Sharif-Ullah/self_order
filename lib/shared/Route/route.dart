// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/modules/ItemPage/ui/item_customise_page.dart';
import 'package:self_order/modules/ItemPage/ui/item_screen_view.dart';
import 'package:self_order/modules/PaymentDone/ui/payment_done_screen_view.dart';
import 'package:self_order/modules/UserChoice/ui/userchoice_screen_view.dart';
import 'package:self_order/modules/banner_combo/ui/banner_combo_page.dart';
import 'package:self_order/modules/banner_deals/ui/banner_deals_page.dart';
import 'package:self_order/modules/payment/ui/payment_screen_view.dart';

import '../../modules/Home/ui/home_screen_view.dart';
import '../../modules/LogIn/ui/Login_screen.dart';
import '../../modules/VideoScreen/ui/video_screen_view.dart';
import '../../modules/check_out/ui/check_out_view.dart';

// class AppRouter {
//   Route? onGeneratedRoute(RouteSettings? route) {
//     switch (route!.name) {
//       case AppRoutes.Login:
//         return PageTransition(
//           child: const LoginScreen(),
//           type: PageTransitionType.fade,
//         );

//       case AppRoutes.VideoScreen:
//         return PageTransition(
//           child: const VideoScreenView(),
//           type: PageTransitionType.fade,
//         );

//       case AppRoutes.UserChoice:
//         return PageTransition(
//           child: const UserChoiceScreen(),
//           type: PageTransitionType.fade,
//         );

//       case AppRoutes.HomeScreen:
//         return PageTransition(
//           child: const HomeScreen(),
//           type: PageTransitionType.fade,
//         );

//       // case '/itempagescreen':
//       //   return PageTransition(
//       //     child: ItemPageScreen(),
//       //     type: PageTransitionType.fade,
//       //   );

//       // case '/itemcustomisePage':
//       //   return PageTransition(
//       //     child: ItemCustomisePage(),
//       //     type: PageTransitionType.fade,
//       //   );

//       case AppRoutes.Checkout:
//         return PageTransition(
//           child: const CheckoutScreen(),
//           type: PageTransitionType.fade,
//         );

//       case AppRoutes.Payment:
//         return PageTransition(
//           child: const PaymentScreen(),
//           type: PageTransitionType.fade,
//         );
//       case AppRoutes.ComboDrink:
//         return PageTransition(
//           child: const ComboDrinkMenu(),
//           type: PageTransitionType.fade,
//         );
//       default:
//         return null;
//     }
//   }
// }

abstract class AppRoutes {
  static const Login = '/';
  static const HomeScreen = '/home';
  static const VideoScreen = '/videoScreen';
  static const UserChoice = '/UerChoice';

  static const ItemCustomize = '/itemCustomizePage';
  static const CustomiseExtra = '/customiseextra';
  static const CustomiseExtraOptions = '/customiseextraoptions/';

  static const Combo = '/combo';
  static const ComboSide = '/comboside';
  static const ComboDrink = '/combodrinks/';

  static const Checkout = '/checkout';
  static const Payment = '/paymentscreen';
  static const PaymentDone = '/paymentDoneScreen';
  static const ItemScreen = '/itemScreen';
  static const BannerCombo = '/bannerCombo';
  static const BannerDeals = '/bannerDeals';
}

class AppRouter {
  Route? onGeneratedRoute(RouteSettings? route) {
    switch (route!.name) {
      case AppRoutes.Login:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.VideoScreen:
        return PageTransition(
          child: const VideoScreenView(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.UserChoice:
        return PageTransition(
          child: const UserChoiceScreen(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.HomeScreen:
        return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.ItemScreen:
        final PageRouteArguments arguments =
            route.arguments as PageRouteArguments;
        return PageTransition(
          child: ItemPageScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.ItemCustomize:
        final PageRouteArguments arguments =
            route.arguments as PageRouteArguments;
        return PageTransition(
          child: ItemCustomizePage(arguments: arguments),
          type: PageTransitionType.fade,
        );

      case AppRoutes.Checkout:
        return PageTransition(
          child: const CheckoutScreen(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.Payment:
        return PageTransition(
          child: const PaymentScreen(),
          type: PageTransitionType.fade,
        );
      case AppRoutes.PaymentDone:
        return PageTransition(
          child: const PaymentDoneScreenView(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.BannerCombo:
        return PageTransition(
          child: const BannerComboPage(),
          type: PageTransitionType.fade,
        );
      case AppRoutes.BannerDeals:
        return PageTransition(
          child: const BannerDealsPage(),
          type: PageTransitionType.fade,
        );

      default:
        return null;
    }
  }
}
