import 'package:get/get.dart';
import 'package:omny_locator/modules/pre_order_omny_card/pre_order_omny_card.dart';
import 'package:omny_locator/modules/profile/profile_binding.dart';
import 'package:omny_locator/modules/profile/profile_screen.dart';

import '../modules/home/home.dart';
import '../modules/login/login.dart';
import '../modules/modules.dart';
import '../modules/result/result_binding.dart';
import '../modules/result/result_screen.dart';
import '../modules/scan_card/scan_card_binding.dart';
import '../modules/scan_card/scan_card_screen.dart';
import '../modules/verification/verification.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION,
      page: () => VerificationScreen(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.PRE_ORDER_OMNY_CARD,
      page: () => PreOrderOmnyCardScreen(),
      binding: PreOrdeOmnyCardBinding(),
    ),
    GetPage(
      name: Routes.SCAN_CARD,
      page: () => ScanCardScreen(),
      binding: ScanCardBinding(),
    ),
    GetPage(
      name: Routes.RESULT,
      page: () => ResultScreen(),
      binding: ResultBinding(),
    ),
  ];
}
