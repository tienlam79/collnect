import 'package:get/get.dart';

import 'scan_pre_order_controller.dart';

class ScanPreOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanPreOrderController>(
        () => ScanPreOrderController(apiRepository: Get.find()));
  }
}
