import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/enum_values/card_type.dart';
import 'package:omny_locator/modules/result/widgets/pre_order_qrcode.dart';
import 'package:omny_locator/shared/shared.dart';

import 'pending_pre_order_detail_controller.dart';

class PendingPreOrderDetailScreen
    extends GetView<PendingPreOrderDetailController> {
  const PendingPreOrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleSpacing: CommonConstants.titleSpacing,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: showAlerConfirm,
            child: GradientText(
              'cancel'.tr,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ],
      titleText: 'pre_order_detail'.tr,
      child: Column(
        children: [
          _buildCardNumber(context),
          SpacingSm(),
          Text(
            'omny_pre_order'.tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
          ),
          SpacingSm(),
          PreOrderQrCode(
            order: controller.order.value,
            onFindLocation: controller.checkLocation,
          ),
        ],
      ),
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
          if (controller.order.value.product.productFilter ==
              CardType.RELOAD) ...[
            SpacingSm(),
            TotalAmount(
                total: controller.order.value.amount.toString(),
                label: 'reload_amount'.tr)
          ]
        ],
      ),
    );
  }

  void showAlerConfirm() {
    Get.dialog(
      AlertConfirm(
        desc: 'cancel_pre_order_confirm'.tr,
        onConfirm: controller.onCancel,
      ),
    );
  }
}
