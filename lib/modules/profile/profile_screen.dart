import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/profile/profile_controller.dart';
import 'package:omny_locator/modules/profile/widgets/pending_pre_order.dart';
import 'package:omny_locator/modules/profile/widgets/pre_order_history.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleSpacing: CommonConstants.titleSpacing,
      bodyPadding: EdgeInsets.zero,
      titleText: 'account'.tr,
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
          _buildUserInfo(context),
          SpacingSm(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Obx(
                  () => Visibility(
                    child: Column(children: [
                      PendingPreOrder(
                        order: controller.pendingPreOrder.value,
                      ),
                      SpacingMd(),
                    ]),
                    visible: controller.pendingPreOrder.value.id != 0.0,
                  ),
                ),
                PreOrderHistory(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white,
        child: ListTile(
          onTap: () => Get.toNamed(Routes.UPDATE_PROFILE),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          trailing: Icon(
            Icons.navigate_next,
            color: ColorConstants.lightSecodaryTextColor,
          ),
          title: Text(
            '${controller.profile.value.firstName ?? ''} ${controller.profile.value.lastName ?? ''}',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: ColorConstants.lightIconColor),
          ),
          subtitle: Text(
            Formatter.formatPhoneNumber(
              controller.profile.value.username ?? '',
              CommonConstants.USCountryCode,
            ),
            style: TextStyle(
                fontSize: 30,
                height: CommonConstants.lineHeight,
                fontWeight: FontWeight.bold,
                color: ColorConstants.lightIconColor),
          ),
        ),
      ),
    );
  }
}
