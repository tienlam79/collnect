import 'package:omny_locator/api/api_repository.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final ApiRepository apiRepository;
  final storage = Get.find<SharedPreferences>();

  SplashController({required this.apiRepository});

  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    try {
      if (storage.getString(StorageConstants.token) != null) {
        checkToken();
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    } catch (e) {
      Get.toNamed(Routes.LOGIN);
    }
  }

  void checkToken() async {
    try {
      var refreshToken = storage.getString(StorageConstants.refreshToken);
      if (refreshToken != null) {
        var newToken = await apiRepository.getRefershToken(
          new RefershTokenRequest(token: refreshToken),
        );
        print('...token...${newToken.toJson()}');
        storage.setString(
          StorageConstants.token,
          newToken.accessToken,
        );
        storage.setString(
          StorageConstants.refreshToken,
          newToken.refreshToken,
        );
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    } catch (error) {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
