import 'package:collnect/routes/app_pages.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFeature extends StatelessWidget {
  LoginFeature({Key? key}) : super(key: key);

  final List<String> features = [
    'feature_1'.tr,
    'feature_2'.tr,
    'feature_3'.tr,
    'feature_4'.tr,
    'feature_5'.tr,
    'feature_6'.tr,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'new_to_collnect'.tr,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: ColorConstants.primaryColor),
          ),
        ),
        SpacingXs(),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'new_to_collnect_desc'.tr,
            textAlign: TextAlign.left,
          ),
        ),
        SpacingSm(),
        ListView.separated(
          itemBuilder: _buildFeatureItem,
          itemCount: features.length,
          separatorBuilder: (context, index) => SpacingXs(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        PrimaryButton(
          text: 'start_free_trial'.tr,
          onPressed: () => {},
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
            'view_pricing'.tr,
            textAlign: TextAlign.center,
          ),
        ),
        SpacingSm(),
        Divider(),
        SpacingSm(),
        Text(
          'copy_right'.tr,
          textAlign: TextAlign.center,
        ),
        Text(
          'all_right'.tr,
          textAlign: TextAlign.center,
        ),
        SpacingXs(),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'term_condition'.tr,
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => Get.toNamed(Routes.LOGIN),
                style: TextStyle(
                  color: ColorConstants.lightButtonBackgroundColor,
                ),
              ),
              TextSpan(text: ' | '),
              TextSpan(
                text: 'privacy_policy'.tr,
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
    );
  }

  Widget _buildFeatureItem(BuildContext context, int index) {
    String text = features[index];
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.dotImg,
            height: 24,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
          )
        ],
      ),
    );
  }
}
