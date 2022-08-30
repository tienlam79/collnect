import 'package:collnect/modules/activation_account/activation_account.dart';
import 'package:collnect/shared/shared.dart';
import 'package:collnect/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivationAccountScreen extends GetView<ActivationAccountController> {
  const ActivationAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeConfig.lightTheme,
      child: Builder(
        builder: (BuildContext c) => _buildMainContent(c),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return MainListWidget(
      showBackIcon: false,
      bodyPadding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(CommonConstants.hPadding),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.logo,
              height: 60,
            ),
            SpacingLg(),
            Text(
              "activation_success".tr,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: ColorConstants.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            SpacingXs(),
            Text(
              'activation_enter_phone'.tr,
              textAlign: TextAlign.center,
            ),
            SpacingLg(),
            PhoneField(
              controller: controller.phoneController,
              labelText: 'us_phone_number'.tr,
            ),
            SpacingSm(),
            Obx(
              () => PrimaryButton(
                text: 'continue'.tr,
                disabled: controller.phoneNumber.value.length < 10,
                onPressed: controller.onSendVerificationCode,
              ),
            )
          ],
        ),
      ),
    );
  }
}
