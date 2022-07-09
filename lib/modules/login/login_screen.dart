import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/theme/theme_data.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeConfig.blueTheme,
      child: Builder(
        builder: (BuildContext c) {
          return _buildContent(c);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return MainListWidget(
      scrollable: false,
      showBackIcon: false,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'login_title'.tr,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          SpacingLg(),
          PhoneField(
            controller: controller.phoneController,
            labelText: 'your_phone_number'.tr,
          ),
          InputField(
            labelText: 'your_name_optional'.tr,
            controller: controller.nameController,
          ),
          SpacingSm(),
          Obx(
            () => PrimaryButton(
              text: 'next'.tr,
              onPressed: controller.onLogin,
              disabled: controller.phoneNumber.value.length < 10,
            ),
          ),
        ],
      ),
    );
  }
}
