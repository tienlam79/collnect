import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';

class AlertConfirm extends StatelessWidget {
  const AlertConfirm({
    Key? key,
    this.title = 'confirmation',
    this.desc = '',
    this.onConfirm,
    this.confirmButtonText,
    this.cancelButtonText,
    this.actions = const [],
  }) : super(key: key);
  final String title;
  final String desc;
  final Function? onConfirm;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      title: Text(title.tr),
      content: Container(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: actions.length > 0
              ? actions
              : [
                  Text(desc),
                  SpacingMd(),
                  Column(
                    children: [
                      OutlinedGradientButton(
                        text: cancelButtonText ?? 'cancel'.tr,
                        onPressed: () => Get.back(),
                      ),
                      SpacingSm(),
                      GradientButton(
                        text: confirmButtonText ?? 'confirm'.tr,
                        onPressed: () {
                          Get.back();
                          onConfirm!();
                        },
                      ),
                    ],
                  )
                ],
        ),
      ),
    );
  }
}
