import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/theme/theme_data.dart';
import 'verification_controller.dart';
import 'widgets/verification_code_input.dart';

class VerificationScreen extends GetView<VerificationController> {
  @override
  Widget build(BuildContext context) {
    final double inputMarginLeft = 10.0;
    final int inputNumber = 6;
    return Theme(
      data: ThemeConfig.blueTheme,
      child: MainListWidget(
        showBackIcon: false,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'verification'.tr,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            SpacingSm(),
            Text(
              'verificaion_desc'.tr,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SpacingMd(),
            VerificationCodeInput(
              length: 6,
              autofocus: true,
              itemMarginLeft: 10.0,
              itemWidth: (Get.width -
                      ((inputNumber - 1) * inputMarginLeft) -
                      (CommonConstants.hPadding * 2)) /
                  inputNumber,
              onChangeCode: controller.onChangeCode,
              onCompleted: controller.onGenerateToken,
            ),
            SpacingMd(),
            Obx(
              () => controller.isStartTimer.value
                  ? TweenAnimationBuilder<Duration>(
                      duration: Duration(minutes: 1),
                      tween: Tween(
                          begin: Duration(minutes: 1),
                          end: Duration(seconds: 1)),
                      onEnd: controller.onEndTimer,
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        // final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Center(
                          child: Text(
                            'resent_verification_code_in'
                                .trParams({'seconds': '$seconds'}),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: TextButton(
                        onPressed: controller.onResentCode,
                        child: Text(
                          'resent_verification_code'.tr,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    // color:
                                    //     ColorConstants.primaryButtonBackgroundColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ),
            ),
            SpacingLg(),
            Obx(
              () => PrimaryButton(
                text: 'submit'.tr,
                disabled: controller.code.value.length < inputNumber,
                onPressed: () =>
                    controller.onGenerateToken(controller.code.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
