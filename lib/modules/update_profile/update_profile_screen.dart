import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:omny_locator/shared/shared.dart';
import 'update_profile_controller.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
        titleSpacing: CommonConstants.titleSpacing,
        titleText: 'update_information'.tr,
        footer: Obx(
          () => GradientButton(
            text: 'update'.tr,
            onPressed: controller.updateProfile,
            disabled:
                '${controller.profile.value.firstName ?? ''} ${controller.profile.value.lastName ?? ''}'
                        .trim() ==
                    controller.name.value.trim(),
          ),
        ),
        child: Column(
          children: [
            InputField(
              labelText: 'your_name'.tr,
              controller: controller.nameController,
            ),
            PhoneField(
              labelText: 'your_phone_number'.tr,
              controller: controller.phoneController,
              enabled: false,
              height: 60,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: CommonConstants.lineHeight,
              ),
            ),
          ],
        ));
  }
}
