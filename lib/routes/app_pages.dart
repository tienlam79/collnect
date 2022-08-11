import 'package:get/get.dart';

import '../modules/comment/comment.dart';
import '../modules/home/home.dart';
import '../modules/login/login.dart';
import '../modules/modules.dart';
import '../modules/nearby_store/nearby_store.dart';
import '../modules/pending_pre_order_detail/pending_pre_order_detail.dart';
import '../modules/pre_order_detail/pre_order_detail.dart';
import '../modules/pre_order_omny_card/pre_order_omny_card.dart';
import '../modules/profile/profile.dart';
import '../modules/result/result_binding.dart';
import '../modules/result/result_screen.dart';
import '../modules/scan_card/scan_card_binding.dart';
import '../modules/scan_card/scan_card_screen.dart';
import '../modules/store_detail/store_detail.dart';
import '../modules/update_profile/update_profile.dart';
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
    GetPage(
      name: Routes.PENDING_PRE_ORDER_DETAIL,
      page: () => PendingPreOrderDetailScreen(),
      binding: PendingPreOrderDetailBinding(),
    ),
    GetPage(
      name: Routes.PRE_ORDER_DETAIL,
      page: () => PreOrderDetailScreen(),
      binding: PreOrderDetailBinding(),
    ),
    GetPage(
      name: Routes.STORE_DETAIL,
      page: () => StoreDetailScreen(),
      binding: StoreDetailBinding(),
    ),
    GetPage(
      name: Routes.NEARBY_STORE,
      page: () => NearbyStoreScreen(),
      binding: NearbyStoreBinding(),
    ),
    GetPage(
      name: Routes.COMMENT,
      page: () => CommentScreen(),
      binding: CommentBinding(),
    ),
    GetPage(
      name: Routes.UPDATE_PROFILE,
      page: () => UpdateProfileScreen(),
      binding: UpdateProfileBinding(),
    ),
  ];
}
