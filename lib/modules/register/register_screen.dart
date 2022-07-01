import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:omny_business/shared/widgets/common/footer_button.dart';
import 'register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      showBackIcon: false,
      appBarBackgroundColor: Colors.transparent,
      backgroundColor: ColorConstants.primaryColor,
      elevation: 0,
      footer: Obx(() => _buildFooterButton(context)),
      child: Obx(
        () => Column(
          children: [
            Text(
              'register_title'.tr,
              maxLines: 2,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 29,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            SpacingMd(),
            _buidForm(context),
          ],
        ),
      ),
      // child: Container(
      //   width: Get.width,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(ImageConstants.linearBg),
      //       fit: BoxFit.cover,
      //       alignment: Alignment.topCenter,
      //     ),
      //   ),
      //   child: SafeArea(
      //     child: Container(
      //       padding: const EdgeInsets.symmetric(
      //           horizontal: CommonConstants.hPadding),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'register_title'.tr,
      //             maxLines: 2,
      //             style: Theme.of(context).textTheme.headline1!.copyWith(
      //                   fontSize: 29,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.w800,
      //                 ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildFooterButton(BuildContext context) {
    switch (controller.step.value) {
      case 1:
        return FooterButton(
          onPressed: controller.onNext,
          text: 'next'.tr,
          disabled: controller.disabledButtonNext.value,
        );
      case 2:
      case 3:
      case 4:
        return Padding(
          padding: EdgeInsets.all(CommonConstants.hPadding),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: SecondaryButton(
                  text: 'back'.tr,
                  onPressed: controller.onBack,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 2,
                child: PrimaryButton(
                  disabled: controller.disabledButtonNext.value,
                  text: controller.step.value == 4 ? 'register'.tr : 'next'.tr,
                  onPressed: controller.step.value == 4
                      ? controller.onRegister
                      : controller.onNext,
                ),
              ),
            ],
          ),
        );

      default:
        return Container();
    }
  }

  Widget _buidForm(BuildContext context) {
    switch (controller.step.value) {
      case 1:
        return Column(
          children: [
            InputField(
              controller: controller.firstNameController,
              labelText: 'first_name'.tr,
              textCapitalization: TextCapitalization.words,
              autofocus: true,
            ),
            InputField(
              controller: controller.lastNameController,
              labelText: 'last_name'.tr,
              textCapitalization: TextCapitalization.words,
            ),
          ],
        );
      case 2:
        return InputField(
          controller: controller.emailController,
          labelText: 'email'.tr,
          autofocus: true,
        );
      case 3:
        return PhoneField(
          controller: controller.phoneController,
          labelText: 'phone_number'.tr,
          autofocus: true,
        );
      case 4:
        return Column(
          children: [
            InputField(
              controller: controller.usernameController,
              labelText: 'username'.tr,
              autofocus: true,
            ),
            InputField(
              labelText: 'password'.tr,
              controller: controller.passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
