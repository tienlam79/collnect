import 'package:collnect/modules/login/login_controller.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageConstants.logo,
          height: 60,
        ),
        SpacingLg(),
        Text(
          "welcome_back".tr,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        SpacingXs(),
        Text(
          'login_desc'.tr,
          textAlign: TextAlign.center,
        ),
        SpacingLg(),
        InputField(
          controller: controller.emailController,
          labelText: 'email_username'.tr,
          hintText: 'email_username_placeholder'.tr,
        ),
        SpacingSm(),
        InputField(
          controller: controller.passwordController,
          labelText: 'password'.tr,
          hintText: 'password_placeholder'.tr,
          labelRight: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(50, 24),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerLeft,
            ),
            child: Text(
              'forgot_your_password'.tr,
            ),
            onPressed: () => {},
          ),
        ),
        SpacingSm(),
        PrimaryButton(
          text: 'login'.tr,
          onPressed: controller.onLogin,
        ),
        SpacingMd(),
        RichText(
          text: TextSpan(
            text: 'already_account'.tr,
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'sign_up_now'.tr,
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
