import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/routes/routes.dart';

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
    // yourIdController.dispose();
    // passwordController.dispose();
  }

  // void onForgotPassword() {}
  // void onRegister() {}
  // void onLogin() {}

  void onChangeCode(String value) {
    code.value = value;
  }

  void onLogin(code) {
    Get.offAllNamed(Routes.HOME);
  }

  void onEndTimer() {
    isStartTimer.value = false;
  }

  void onResentCode() {}
}
