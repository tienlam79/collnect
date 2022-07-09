import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../button/primary_button.dart';
import '../spacing/spacing_md.dart';
import '../spacing/spacing_sm.dart';

class EnablePermissionAlert extends StatelessWidget {
  const EnablePermissionAlert({
    Key? key,
    required this.image,
    required this.enableButtonText,
    required this.desc,
    required this.onEnable,
  }) : super(key: key);
  final String image;
  final String desc;
  final String enableButtonText;
  final Function()? onEnable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 220,
        ),
        SpacingSm(),
        Text(
          desc,
          textAlign: TextAlign.center,
        ),
        SpacingMd(),
        PrimaryButton(
          text: enableButtonText,
          onPressed: onEnable,
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Text('later'.tr),
        ),
      ],
    );
  }
}
