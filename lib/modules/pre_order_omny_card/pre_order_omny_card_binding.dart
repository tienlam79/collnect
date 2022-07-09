import 'package:get/get.dart';
import 'package:omny_locator/modules/pre_order_omny_card/pre_order_omny_card_controller.dart';

class PreOrdeOmnyCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreOrderOmnyCardController>(
        () => PreOrderOmnyCardController(apiRepository: Get.find()));
  }
}
