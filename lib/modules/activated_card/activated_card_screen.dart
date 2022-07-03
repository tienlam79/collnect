import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/activated_card/activated_card_controller.dart';
import 'package:omny_business/modules/activated_card/widgets/prepaid_credit.dart';
import 'package:omny_business/routes/app_pages.dart';
import 'package:omny_business/shared/shared.dart';

class ActivatedCardScreen extends GetView<ActivatedCardController> {
  const ActivatedCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'activated_new_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit(amount: 500.0)],
      child: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        PhoneField(
          autofocus: true,
          controller: controller.phoneController,
          labelText: 'customer_phone_number'.tr,
        ),
        InputField(
          controller: controller.nameController,
          labelText: 'name_optional'.tr,
        ),
        SpacingSm(),
        Obx(
          () => GradientButton(
            text: 'next'.tr,
            disabled: controller.phoneText.value.length < 10,
            onPressed: () => Get.toNamed(
                Routes.ACTIVATED_CARD + Routes.SCAN_BAR_CODE,
                arguments: controller),
          ),
        ),
        TextButton(
            onPressed: () => {},
            child: Text('activated_without_phone_number'.tr)),
      ],
    );
  }
}
