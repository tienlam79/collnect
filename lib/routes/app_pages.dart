import 'package:get/get.dart';

import '../modules/modules.dart';

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
      name: Routes.SIGNUP,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.ACTIVATION_ACCOUNT,
      page: () => ActivationAccountScreen(),
      binding: ActivationAccountBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION_CODE,
      page: () => VerificationCodeScreen(),
      binding: VerificationCodeBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP_SUCCESS,
      page: () => SignupSuccessScreen(),
      binding: SignupSuccessBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
