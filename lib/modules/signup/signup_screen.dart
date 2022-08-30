import 'package:collnect/routes/routes.dart';
import 'package:collnect/theme/theme_data.dart';

import 'signup_controller.dart';
import 'widgets/signup_form.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/signup_banner.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

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
      bodyPadding: const EdgeInsets.all(0),
      title: Container(
        child: Image.asset(
          ImageConstants.logo,
          height: 40,
        ),
      ),
      showBackIcon: false,
      footer: PrimaryButton(
        text: 'signup'.tr,
        onPressed: controller.onSignIn,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignupBannner(),
            Padding(
              padding: const EdgeInsets.all(CommonConstants.hPadding),
              child: SignupForm(controller: controller),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.ACTIVATION_ACCOUNT),
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }
}
