import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SpacingMd(),
          RichText(
            text: TextSpan(
              text: 'already_account'.tr,
              style: Theme.of(context).textTheme.subtitle1,
              children: <TextSpan>[
                TextSpan(
                  text: 'sign_in'.tr,
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
