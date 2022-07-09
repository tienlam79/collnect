import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/reload_card/reload_card.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/utils/helpers.dart';

import '../activated_card/widgets/enter_phone_number.dart';
import '../activated_card/widgets/prepaid_credit.dart';

class ReloadCardScreen extends GetView<ReloadCardController> {
  const ReloadCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'reload_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit()],
      child: EnterPhoneNumber(
        phoneController: controller.phoneController,
        nameController: controller.nameController,
        phoneText: controller.phoneText,
        onNext: () => Helpers.checkCameraPermission(context, controller),
      ),
    );
  }
}
