import 'package:get/get.dart';
import 'activation_account_controller.dart';

class ActivationAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivationAccountController>(
        () => ActivationAccountController(apiRepository: Get.find()));
  }
}
