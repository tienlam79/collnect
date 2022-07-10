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
        Get.offNamed(Routes.LOGIN);
      }
    } catch (e) {
      Get.offNamed(Routes.LOGIN);
    }
  }

  void checkToken() async {
    try {
      var refreshToken = storage.getString(StorageConstants.refreshToken);
      if (refreshToken != null) {
        var newToken = await apiRepository.getRefershToken(
          new RefershTokenRequest(token: refreshToken),
        );
        storage.setString(
          StorageConstants.token,
          newToken.accessToken,
        );
        storage.setString(
          StorageConstants.refreshToken,
          newToken.refreshToken,
        );
        print('...acessstoken...${newToken.toJson()}');
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    } catch (error) {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
