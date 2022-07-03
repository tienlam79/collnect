import 'package:get/get.dart';
import 'package:omny_business/modules/add_credit/add_credit_binding.dart';
import 'package:omny_business/modules/add_credit/add_credit_screen.dart';

import '../modules/activated_card/activated_card.dart';
import '../modules/home/home.dart';
import '../modules/login/login.dart';
import '../modules/modules.dart';
import '../modules/register/register.dart';
import '../modules/reload_card/reload_card.dart';
import '../modules/result/result_binding.dart';
import '../modules/result/result_screen.dart';
import '../modules/scan_card/scan_card_binding.dart';
import '../modules/scan_card/scan_card_screen.dart';
import '../modules/scan_pre_order/scan_pre_order.dart';
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
      name: Routes.ACTIVATED_CARD,
      page: () => ActivatedCardScreen(),
      binding: ActivatedCardBinding(),
      children: [
        GetPage(
          name: Routes.SCAN_BAR_CODE,
          page: () => ScanBarCode(),
        ),
        GetPage(
          name: Routes.PRODUCT_FORM,
          page: () => ActivatedCardProductForm(),
        ),
      ],
    ),
    GetPage(
      name: Routes.RELOAD_CARD,
      page: () => ReloadCardScreen(),
      binding: ReloadCardBinding(),
      children: [
        GetPage(
          name: Routes.PRODUCT_FORM,
          page: () => ReloadCardProductForm(),
        ),
      ],
    ),
    GetPage(
      name: Routes.SCAN_PRE_ORDER,
      page: () => ScanPreOrderScreen(),
      binding: ScanPreOrderBinding(),
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
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.ADD_CREDIT,
      page: () => AddCreditScreen(),
      binding: AddCreditBinding(),
    ),
  ];
}
