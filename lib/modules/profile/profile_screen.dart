import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/profile/profile_controller.dart';
import 'package:omny_locator/modules/profile/widgets/pending_pre_order.dart';
import 'package:omny_locator/modules/profile/widgets/pre_order_history.dart';
import 'package:omny_locator/shared/shared.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleSpacing: CommonConstants.titleSpacing,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: controller.onLogout,
            child: GradientText('logout'.tr),
          ),
        ),
      ],
      child: Column(
        children: [
          Obx(
            () => ItemTile(
              title: 'your_phone_number'.tr,
              value: Formatter.formatPhoneNumber(
                controller.profile.value.username ?? '',
                CommonConstants.USCountryCode,
              ),
              valueStyle: TextStyle(
                fontSize: 36,
                height: CommonConstants.lineHeight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SpacingSm(),
          Obx(
            () => Visibility(
              child: PendingPreOrder(order: controller.pendingPreOrder.value),
              visible: controller.pendingPreOrder.value.id != 0.0,
            ),
          ),
          SpacingMd(),
          PreOrderHistory(),
        ],
      ),
      titleText: 'account'.tr,
    );
  }
}
