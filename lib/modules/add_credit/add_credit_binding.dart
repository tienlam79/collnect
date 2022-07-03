import 'package:get/get.dart';
import 'add_credit_controller.dart';

class AddCreditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCreditController>(
        () => AddCreditController(apiRepository: Get.find()));
  }
}
