import 'package:collnect/shared/shared.dart';
import 'package:collnect/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verification_code_controller.dart';

class VerificationCodeScreen extends GetView<VerificationCodeController> {
  const VerificationCodeScreen({Key? key}) : super(key: key);
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
      bodyPadding: EdgeInsets.zero,
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
              "verification_code".tr,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: ColorConstants.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            SpacingXs(),
            Text(
              'verification_code_desc'.tr,
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Text(
                '${Formatter.formatPhoneNumber(controller.phoneNumber.value, CommonConstants.USCountryCode)}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SpacingLg(),
            NumberField(
              autofocus: true,
              controller: controller.codeController,
              labelText: 'verification_code_input'.tr,
              hintText: 'enter_verification_code'.tr,
            ),
            SpacingSm(),
            Obx(
              () => PrimaryButton(
                text: 'continue'.tr,
                disabled: controller.code.value.length < 4,
                onPressed: controller.onVerify,
              ),
            ),
            SpacingSm(),
            Obx(
              () => controller.isStartTimer.value
                  ? TweenAnimationBuilder<Duration>(
                      duration: Duration(minutes: 2),
                      tween: Tween(
                        begin: Duration(minutes: 2),
                        end: Duration(seconds: 1),
                      ),
                      onEnd: controller.onEndTimer,
                      builder: (BuildContext context, Duration value,
                              Widget? child) =>
                          Text(
                              '0${value.inMinutes}:${value.inSeconds % 60 > 10 ? '' : '0'}${value.inSeconds % 60}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: ColorConstants
                                        .lightButtonBackgroundColor,
                                  )),
                    )
                  : Center(
                      child: TextButton(
                        onPressed: controller.onVerify,
                        child: Text(
                          'resend_code'.tr,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
