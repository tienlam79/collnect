import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/shared.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingMd(),
                Text(
                  'login_title'.tr,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 29,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                SpacingMd(),
                InputField(
                  controller: controller.yourIdController,
                  labelText: 'your_id'.tr,
                ),
                InputField(
                  labelText: 'password'.tr,
                  controller: controller.passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SpacingSm(),
                Obx(
                  () => PrimaryButton(
                    text: 'login'.tr,
                    onPressed: controller.onLogin,
                    disabled: controller.yourId.value == '' ||
                        controller.password.value == '',
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: controller.onForgotPassword,
                    child: Text(
                      'forgot_your_password'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorConstants.primaryButtonBackgroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: TextButton(
              onPressed: controller.onRegister,
              child: Text(
                'register_new_business'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorConstants.primaryButtonBackgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
