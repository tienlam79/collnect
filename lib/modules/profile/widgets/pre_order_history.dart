import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/profile/widgets/pre_order_history_controller.dart';
import 'package:omny_locator/modules/profile/widgets/pre_order_history_item.dart';
import 'package:omny_locator/shared/shared.dart';

class PreOrderHistory extends StatelessWidget {
  final PreOrderHistoryController controller =
      Get.put(PreOrderHistoryController(apiRepository: Get.find()));
  PreOrderHistory({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.total.value > 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(text: 'pre_order_history'.tr),
            SpacingXs(),
            ListView.separated(
              shrinkWrap: true,
              controller: controller.scrollController,
              itemCount: controller.orders.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SpacingXs(),
              itemBuilder: (BuildContext context, int index) =>
                  PreOrderHistoryItem(
                order: controller.orders[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
