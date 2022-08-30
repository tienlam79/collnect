import 'package:get/get.dart';
import 'verification_code_controller.dart';

class VerificationCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeController>(
        () => VerificationCodeController(apiRepository: Get.find()));
  }
}
