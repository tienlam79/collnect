import 'package:collnect/modules/login/login_controller.dart';
import 'package:collnect/modules/login/widgets/login_feature.dart';
import 'package:collnect/modules/login/widgets/login_form.dart';
import 'package:collnect/shared/shared.dart';
import 'package:collnect/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(CommonConstants.hPadding),
            child: LoginForm(controller: controller),
          ),
          Container(
            padding: const EdgeInsets.all(CommonConstants.hPadding),
            child: LoginFeature(),
          ),
        ],
      ),
    );
  }
}
