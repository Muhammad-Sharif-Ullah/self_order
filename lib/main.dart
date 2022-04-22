import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:self_order/modules/LogIn/ui/Login_screen.dart';
import 'package:self_order/routes/app_pages.dart';
import 'package:self_order/shared/Route/route.dart';
import 'package:self_order/shared/theme/theme_service.dart';
import 'package:self_order/shared/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(DevicePreview(
      enabled: true,
      builder: (context) =>  MyApp(
        appRouter: AppRouter(),
      ),
    ),);


}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;
   MyApp({Key? key,this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(744,1133),
      builder: () {
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
          home: LoginScreen(),
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
