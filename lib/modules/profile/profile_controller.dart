import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final ApiRepository apiRepository;
  ProfileController({required this.apiRepository});

  Rx<Profile> profile = new Profile().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
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

      Get.offAllNamed(Routes.LOGIN);
    } catch (error) {
      storage.setString(StorageConstants.token, '');
      storage.setString(StorageConstants.refreshToken, '');
      // storage.setString(StorageConstants.playerId, '');
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
