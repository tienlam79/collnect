import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationController extends GetxController {
  final ApiRepository apiRepository;
  VerificationController({required this.apiRepository});

  RxString code = ''.obs;
  RxBool isStartTimer = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeCode(String value) {
    code.value = value;
  }

  void onGenerateToken(String code) async {
    try {
      List params = Get.arguments;
      String username = params[0];
      String checkCode = params[1];
      GenerateTokenRequest payload = new GenerateTokenRequest(
        username: username,
        password: '$code@$checkCode',
      );
      var res = await apiRepository.generateToken(payload);
      final prefs = Get.find<SharedPreferences>();
      if (res.accessToken.isNotEmpty && res.refreshToken.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.accessToken);
        prefs.setString(StorageConstants.refreshToken, res.refreshToken);
        Get.offAllNamed(Routes.HOME);
      }
    } catch (error) {}
  }

  void onEndTimer() {
    isStartTimer.value = false;
  }

  void onResentCode() async {
    try {
      List params = Get.arguments;
      String username = params[0];
      String checkCode = params[1];
      SendVerificationCodeRequest payload = new SendVerificationCodeRequest(
        username: username,
        checkCode: checkCode,
      );
      await apiRepository.sendVerificationCode(payload);
    } catch (error) {}
  }
}
