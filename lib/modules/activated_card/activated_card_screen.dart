import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/activated_card/activated_card_controller.dart';
import 'package:omny_business/modules/activated_card/widgets/enter_phone_number.dart';
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
        actions: [PrepaidCredit()],
        child: Column(
          children: [
            EnterPhoneNumber(
              phoneController: controller.phoneController,
              nameController: controller.nameController,
              phoneText: controller.phoneText,
              onNext: () => Get.toNamed(
                  Routes.ACTIVATED_CARD + Routes.SCAN_BAR_CODE,
                  arguments: controller),
            ),
            TextButton(
              onPressed: () => {},
              child: GradientText('activate_without_phone_number'.tr),
            ),
          ],
        ));
  }
}
