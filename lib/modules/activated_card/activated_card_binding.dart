import 'package:get/get.dart';
import 'package:omny_business/modules/activated_card/activated_card_controller.dart';

class ActivatedCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivatedCardController>(
        () => ActivatedCardController(apiRepository: Get.find()));
  }
}
