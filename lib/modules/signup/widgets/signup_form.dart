import 'package:collnect/modules/signup/signup_controller.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'signup_desc_1'.tr,
            style: TextStyle(color: ColorConstants.lightPrimaryTextColor),
            children: <TextSpan>[
              TextSpan(
                text: '100 message credits '.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
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
                textCapitalization: TextCapitalization.sentences,
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
                textCapitalization: TextCapitalization.words,
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
          obscureText: true,
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
            style: TextStyle(color: ColorConstants.lightPrimaryTextColor),
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
