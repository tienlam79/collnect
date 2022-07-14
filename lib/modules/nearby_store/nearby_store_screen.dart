import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/nearby_store/nearby_store_list.dart';
import 'package:omny_locator/shared/shared.dart';

import 'nearby_store_controller.dart';

class NearbyStoreScreen extends GetView<NearbyStoreController> {
  NearbyStoreScreen({
    Key? key,
  });
  // final NearbyStoreController controller =
  //     Get.put(NearbyStoreController(apiRepository: Get.find()));

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'omny_location_near_you'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      child: Obx(
        () => NearbyStoreList(
          stores: controller.stores,
          scrollController: controller.scrollController,
          sortByOption: controller.sortByOption.value,
          sortByOptions: controller.sortByOptions,
          onChangeSort: controller.onChangeSort,
        ),
      ),
    );
  }
}
