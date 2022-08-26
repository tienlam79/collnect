import 'package:collnect/modules/signup/signup_controller.dart';
import 'package:collnect/modules/signup/widgets/signup_success.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/signup_banner.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      bodyPadding: const EdgeInsets.all(0),
      title: Container(
        child: Image.asset(
          ImageConstants.logo,
          height: 40,
        ),
      ),
      showBackIcon: false,
      footer: Obx(
        () => controller.isSuccess.value
            ? Container()
            : PrimaryButton(
                text: 'signup'.tr,
                onPressed: controller.onSignIn,
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignupBannner(),
          Padding(
            padding: const EdgeInsets.all(CommonConstants.hPadding),
            child: Obx(
              () => controller.isSuccess.value
                  ? SignUpSuccess()
                  : _buildForm(context),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'signup_desc_1'.tr,
            style: Theme.of(context).textTheme.subtitle1,
            children: <TextSpan>[
              TextSpan(
                text: '100 message credits '.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'signup_desc_2'.tr,
              ),
            ],
          ),
        ),
        SpacingMd(),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: InputField(
                controller: controller.firstNameController,
                labelText: 'first_name'.tr,
                hintText: 'first_name_placeholder'.tr,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 1,
              child: InputField(
                controller: controller.lastNameController,
                labelText: 'last_name'.tr,
                hintText: 'last_name_placeholder'.tr,
              ),
            ),
          ],
        ),
        SpacingSm(),
        InputField(
          controller: controller.emailController,
          labelText: 'email'.tr,
          hintText: 'email_placeholder'.tr,
        ),
        SpacingSm(),
        InputField(
          controller: controller.passwordController,
          labelText: 'password'.tr,
          hintText: 'password_placeholder'.tr,
        ),
        SpacingSm(),
        InputField(
          controller: controller.referralCodeController,
          labelText: 'referral_code'.tr,
          hintText: 'referral_code_placeholder'.tr,
        ),
        SpacingSm(),
        RichText(
          text: TextSpan(
            text: 'signup_tc'.tr,
            style: Theme.of(context).textTheme.subtitle1,
            children: <TextSpan>[
              TextSpan(text: ', '),
              TextSpan(
                text: 'collnect_term_of_use'.tr,
                style: TextStyle(
                  color: ColorConstants.lightButtonBackgroundColor,
                ),
              ),
              TextSpan(text: ', '),
              TextSpan(
                text: 'responsible_use_policy'.tr,
                style: TextStyle(
                  color: ColorConstants.lightButtonBackgroundColor,
                ),
              ),
              TextSpan(text: ', and '),
              TextSpan(
                text: 'privacy_policy'.tr,
                style: TextStyle(
                  color: ColorConstants.lightButtonBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
