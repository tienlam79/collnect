import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/activated_card/activated_card_controller.dart';
import 'package:omny_business/routes/app_pages.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:omny_business/shared/utils/helpers.dart';
import 'widgets/customer_info.dart';
import 'widgets/prepaid_credit.dart';

class EnterAmount extends StatelessWidget {
  EnterAmount({Key? key}) : super(key: key);

  final ActivatedCardController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'activated_new_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit(amount: 500.0)],
      footer: Obx(
        () => Visibility(
          visible: controller.product.value.id != 0.0,
          child: SecondaryButton(
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
        if (controller.prefixCode.value != '')
          NumberField(
            controller: controller.prefixCardNumberController,
            labelText: 'omny_card_prefix'.tr,
            maxLines: 1,
            enabled: false,
          ),
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
            visible: controller.selectedAmount.value != 0.0,
            child: Column(
              children: [
                SpacingSm(),
                FeeCard(
                  amount: controller.selectedAmount.value,
                  fee: controller.fee.value,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
