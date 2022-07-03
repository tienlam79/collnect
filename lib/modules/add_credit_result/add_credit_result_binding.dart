import 'package:get/get.dart';
import 'add_credit_result_controller.dart';

class AddCreditResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCreditResultController>(
        () => AddCreditResultController(apiRepository: Get.find()));
  }
}
