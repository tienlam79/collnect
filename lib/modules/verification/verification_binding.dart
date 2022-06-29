import 'package:get/get.dart';
import 'verification_controller.dart';

class VerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(
        () => VerificationController(apiRepository: Get.find()));
  }
}
