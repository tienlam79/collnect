import 'package:get/get.dart';

import 'nearby_store_controller.dart';

class NearbyStoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearbyStoreController>(
        () => NearbyStoreController(apiRepository: Get.find()));
  }
}
