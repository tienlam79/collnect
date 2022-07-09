import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/reload_card/reload_card.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/utils/helpers.dart';

import '../activated_card/widgets/customer_info.dart';
import '../activated_card/widgets/prepaid_credit.dart';

class ReloadCardProductForm extends StatelessWidget {
  ReloadCardProductForm({Key? key}) : super(key: key);

  final ReloadCardController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'reload_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit()],
      footer: Obx(
        () => Visibility(
          visible: controller.product.value.id != 0.0,
          child: PrimaryButton(
            onPressed: controller.onSubmit,
            disabled: !Helpers.checkValidAmount(
                controller.product.value, controller.selectedAmount.value),
            text: 'activate_load_card'.tr,
          ),
        ),
      ),
      child: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        CustomerInfo(
          phoneNumber: controller.phoneController.text,
          name: controller.nameText.value,
        ),
        SpacingSm(),
        _buildProductInputAmount(context)
      ],
    );
  }

  Widget _buildCardNumberField(BuildContext context) {
    return NumberField(
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
    );
  }

  Widget _buildProductInputAmount(BuildContext context) {
    return Column(
      children: [
        _buildCardNumberField(context),
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
            child: Column(
              children: [
                SpacingSm(),
                TotalAmount(
                  label: 'reload_amount'.tr,
                  total: '${controller.selectedAmount.value}',
                ),
              ],
            ),
            visible: controller.selectedAmount.value != 0.0,
          ),
        )
      ],
    );
  }
}
