import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:get/get.dart';
import 'package:omny_business/theme/theme_data.dart';

import 'app_binding.dart';
import 'di.dart';
import 'lang/lang.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();

  runApp(App());
  configLoading();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: 'Flutter GetX Boilerplate',
      // darkTheme: ThemeConfig.darkTheme,
      theme: ThemeConfig.lightTheme,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: EasyLoading.init(),
      routingCallback: onRoutingCallback,
    );
  }

  void onRoutingCallback(Routing? routing) {
    // if ([
    //       Routes.HOME,
    //       Routes.LOGIN,
    //       Routes.REGISTER,
    //       Routes.VERIFICATION,
    //       '/HomeScreen'
    //     ].indexWhere((element) => routing?.current == element) >
    //     -1) {
    //   if (Get.theme != ThemeConfig.blueTheme) {
    //     Get.changeTheme(ThemeConfig.blueTheme);
    //   }
    // }
    // if (routing?.current == Routes.HOME ||
    //     routing?.current == '/HomeScreen' &&
    //         Get.theme != ThemeConfig.blueTheme) {
    //   Get.changeTheme(ThemeConfig.blueTheme);
    // }
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = ColorConstants.primaryColor
    ..textColor = ColorConstants.primaryColor
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
