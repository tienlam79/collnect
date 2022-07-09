import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/utils/helpers.dart';

import 'pre_order_omny_card_controller.dart';

class PreOrderOmnyCardScreen extends GetView<PreOrderOmnyCardController> {
  const PreOrderOmnyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'pre_order_omny_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      child: _buildProductInputAmount(context),
      footer: Obx(
        () => Visibility(
          visible: controller.product.value.id != 0.0,
          child: PrimaryButton(
            onPressed: controller.onSubmit,
            disabled: !Helpers.checkValidAmount(
                controller.product.value, controller.selectedAmount.value),
            text: controller.selectedAmount.value == 0.0
                ? 'submit'.tr
                : 'submit_pre_order'.tr,
          ),
        ),
      ),
    );
  }

  Widget _buildProductInputAmount(BuildContext context) {
    return Column(
      children: [
        NumberField(
          controller: controller.cardNumberController,
          labelText: 'omny_card_number'.tr,
          maxLines: 1,
          suffixIconConstraints: BoxConstraints(
            minWidth: CommonConstants.iconSize,
            minHeight: CommonConstants.iconSize,
          ),
          suffixIcon: InkWell(
            child: Image.asset(
              ImageConstants.barCodeDarkIcon,
              width: CommonConstants.iconSize,
              height: CommonConstants.iconSize,
            ),
            onTap: () => Get.toNamed(Routes.SCAN_CARD, arguments: controller),
          ),
        ),
        Obx(
          () => Visibility(
            child: ProductAmount(
              amountController: controller.amountController,
              selectedAmount: controller.selectedAmount,
              product: controller.product.value,
              onSelectSuggestAmount: controller.onSelectAmount,
            ),
            visible: controller.product.value.id != 0,
          ),
        ),
        Obx(
          () => Visibility(
            visible: controller.selectedAmount.value != 0.0,
            child: Column(
              children: [
                SpacingSm(),
                TotalAmount(
                  label: 'reload_amount'.tr,
                  total: '${controller.selectedAmount.value}',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
