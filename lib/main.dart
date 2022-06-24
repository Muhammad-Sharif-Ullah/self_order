import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:self_order/modules/Home/ui/home_screen_view.dart';
import 'package:self_order/modules/LogIn/ui/Login_screen.dart';
import 'package:self_order/modules/VideoScreen/ui/video_screen_view.dart';
import 'package:self_order/modules/combo_screen_two/ui/combo_screen_two_view.dart';
import 'package:self_order/request/session.dart';
import 'package:self_order/shared/Route/route.dart';
import 'package:self_order/shared/theme/theme_service.dart';
import 'package:self_order/shared/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;
  MyApp({Key? key, this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(744, 1133),
      builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService().getThemeMode(),
          // builder: EasyLoading.init(),
          //theme: ThemeConfig.lightTheme,
          title: 'SelfOrder',
          // enableLog: true,
          onGenerateRoute: appRouter!.onGeneratedRoute,
          home:
              // ComboScreenViewTwo(itemtype: 'l'),
              (Session.getToken() == '') ? LoginScreen() : VideoScreenView(),
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    // ..backgroundColor = ColorConstants.lightGray
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.grey.withOpacity(0.3)
    //..indicatorColor = hexToColor('#64DEE0')
    //..textColor = hexToColor('#64DEE0')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.offset;
}
