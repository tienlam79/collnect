import 'package:collnect/routes/routes.dart';
import 'package:collnect/theme/theme_data.dart';
import 'package:flutter/gestures.dart';

import '../signup/widgets/signup_banner.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({Key? key}) : super(key: key);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignupBannner(),
          Padding(
            padding: const EdgeInsets.all(CommonConstants.hPadding),
            child: _buildContent(context),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.ACTIVATION_ACCOUNT),
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorConstants.zanah,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                GradientText(
                  'register_success_title'.tr,
                  gradient: LinearGradient(colors: [
                    hexToColor('#00A056'),
                    hexToColor('#008A4A'),
                    hexToColor('#00703C'),
                  ]),
                  style: Theme.of(context).textTheme.headline3,
                ),
                SpacingSm(),
                Text(
                  'register_success_desc'.tr,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SpacingMd(),
          RichText(
            text: TextSpan(
              text: 'already_account'.tr,
              children: <TextSpan>[
                TextSpan(
                  text: 'sign_in'.tr,
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(Routes.LOGIN),
                  style: TextStyle(
                    color: ColorConstants.lightButtonBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
