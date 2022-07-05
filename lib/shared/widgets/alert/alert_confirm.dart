import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/widgets/button/primary_button.dart';
import 'package:omny_business/shared/widgets/spacing/spacing_sm.dart';

class AlertConfirm extends StatelessWidget {
  const AlertConfirm({
    Key? key,
    this.title = 'confirmation',
    this.desc = '',
    this.onConfirm,
    this.confirmButtonText = 'confirm',
    this.cancelButtonText = 'cancel',
    this.actions = const [],
  }) : super(key: key);
  final String title;
  final String desc;
  final Function? onConfirm;
  final String confirmButtonText;
  final String cancelButtonText;
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
                  SpacingSm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: cancelButtonText,
                          onPressed: () => Get.back(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: PrimaryButton(
                          variant: 'danger',
                          text: confirmButtonText,
                          onPressed: () {
                            Get.back();
                            onConfirm!();
                          },
                        ),
                      ),
                    ],
                  )
                ],
        ),
      ),
    );
  }
}
