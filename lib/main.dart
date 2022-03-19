import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:self_order/modules/LogIn/ui/Login_screen.dart';
import 'package:self_order/routes/app_pages.dart';
import 'package:self_order/routes/app_routes.dart';
import 'package:self_order/shared/theme/theme_service.dart';
import 'package:self_order/shared/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    );

    configLoading();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      builder: EasyLoading.init(),
      //theme: ThemeConfig.lightTheme,
      title: 'SelfOrder',
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      smartManagement: SmartManagement.keepFactory,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() async {
    super.initState();
    Get.to(LoginScreen(),transition: Transition.fade);
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("sasas"),
      ),
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
