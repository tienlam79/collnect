import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';

import 'pre_order_detail_controller.dart';

class PreOrderDetailScreen extends GetView<PreOrderDetailController> {
  const PreOrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleSpacing: CommonConstants.titleSpacing,
      titleText: 'reload_detail'.tr,
      footer: GradientButton(
        text: 'pre_reload_again'.tr,
        onPressed: () => Get.toNamed(
          Routes.PRE_ORDER_OMNY_CARD,
          arguments: [
            '${controller.order.value.productPrefix}${controller.order.value.productPin}',
            controller.order.value.amount
          ],
        ),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          SpacingSm(),
          _buildCardNumber(context),
          SpacingSm(),
          Obx(
            () => controller.store.value.id != 0
                ? StoreDetailItem(
                    store: controller.store.value,
                    storeNamePrefix: 'reload_at'.tr,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          size: 40,
          color: ColorConstants.lightButtonBackgroundColor,
        ),
        SpacingSm(),
        Text('reload_completed'.tr,
            style: Theme.of(context).textTheme.headline5),
        SpacingXs(),
        Text('Transaction ID: ${controller.order.value.transactionId}',
            style: Theme.of(context).textTheme.subtitle1),
        Text(
            DateFormat('HH:mm MM-dd-yyyy').format(
              controller.order.value.createdAt ?? DateTime.now(),
            ),
            style: Theme.of(context).textTheme.subtitle1)
      ],
    );
  }

  Widget _buildCardNumber(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          ItemTile(
            title: 'omny_card_number'.tr,
            value: controller.order.value.productPin,
          ),
          SpacingSm(),
          TotalAmount(
            total: controller.order.value.amount.toString(),
            label: 'reload_amount'.tr,
          )
        ],
      ),
    );
  }
}
