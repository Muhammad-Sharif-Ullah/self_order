import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../modules/LogIn/ui/Login_screen.dart';
import '../../modules/VideoScreen/ui/video_screen_view.dart';
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

      // case '/collectionprice':
      //   return PageTransition(
      //     child: CollectionPriceScreen(),
      //     type: PageTransitionType.fade,
      //   );
      //
      // case '/otpscreen':
      //   return PageTransition(
      //     child: OtpScreenView(),
      //     type: PageTransitionType.fade,
      //   );
      //
      //
      // case '/homeScreen':
      //   return PageTransition(
      //     child: HomeScreenView(),
      //     type: PageTransitionType.fade,
      //   );

      default:
        return null;
    }
  }
}