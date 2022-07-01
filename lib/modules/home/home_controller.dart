import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/routes/routes.dart';
import 'package:omny_business/shared/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  RxString name = 'NYSTORE01'.obs;
  RxDouble creditBalance = 500.0.obs;
  final List<Feature> featureList = [
    new Feature(
      icon: ImageConstants.reloadIcon,
      title: 'reload'.tr,
      subTitle: 'OMNY card',
      route: Routes.RELOAD_CARD,
    ),
    new Feature(
      icon: ImageConstants.scanIcon,
      title: 'scan'.tr,
      subTitle: 'Pre-order',
      route: Routes.SCAN_PRE_ORDER,
    ),
    new Feature(
      icon: ImageConstants.activatedIcon,
      title: 'activated'.tr,
      subTitle: 'new OMNY card',
      route: Routes.ACTIVATED_CARD,
    ),
  ];

  Rx<Profile> profile = new Profile(
    balance: 0.0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProfile() async {
    try {
      var res = await apiRepository.getProfile();
      profile.value = res;
    } catch (error) {}
  }

  void onLogout() async {
    print('lllog');
    var storage = Get.find<SharedPreferences>();
    var token = storage.getString(StorageConstants.token);
    final payload = new RefershTokenRequest(token: token);
    // var deviceId = storage.getString(StorageConstants.deviceId);

    try {
      await apiRepository.revokeToken(payload);
      storage.setString(StorageConstants.token, '');
      storage.setString(StorageConstants.refreshToken, '');
      // if (deviceId != null) {
      //   await apiRepository.unsubscribeNotification(deviceId);
      //   storage.setString(StorageConstants.deviceId, '');
      // }
      Get.offAllNamed(Routes.LOGIN);
    } catch (error) {
      storage.setString(StorageConstants.token, '');
      storage.setString(StorageConstants.refreshToken, '');
      // storage.setString(StorageConstants.playerId, '');
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
