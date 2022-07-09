import 'package:get/get.dart';

import 'pending_pre_order_detail_controller.dart';

class PendingPreOrderDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendingPreOrderDetailController>(
        () => PendingPreOrderDetailController(apiRepository: Get.find()));
  }
}
