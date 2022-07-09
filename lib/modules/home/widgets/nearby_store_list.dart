import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/home/widgets/nearby_store_item.dart';
import 'package:omny_locator/modules/home/widgets/nearby_store_list_controller.dart';
import 'package:omny_locator/shared/shared.dart';

class NearbyStoreList extends StatelessWidget {
  NearbyStoreList({Key? key}) : super(key: key);

  final NearbyStoreListController controller =
      Get.put(NearbyStoreListController(apiRepository: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SectionTitle(text: 'store_near_you'.tr),
          ],
        ),
        Obx(
          () => controller.stores.length == 0 && !controller.initLoading.value
              ? EmptyList(
                  image: ImageConstants.emptyHistory,
                  title: 'no_nearby_store'.tr,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  itemCount: controller.stores.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NearbyStoreItem(
                    store: controller.stores[index],
                  ),
                ),
        ),
      ],
    );
  }
}
