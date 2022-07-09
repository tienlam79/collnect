import 'package:get/get.dart';

import 'pre_order_detail_controller.dart';

class PreOrderDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreOrderDetailController>(
        () => PreOrderDetailController(apiRepository: Get.find()));
  }
}
