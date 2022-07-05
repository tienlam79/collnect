import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/constants/colors.dart';

class AlertInfo extends StatelessWidget {
  final String title;
  final String desc;
  final Widget? body;
  final List<Widget>? actions;
  final bool showCloseButton;
  final bool scrollable;

  const AlertInfo({
    Key? key,
    this.title = '',
    this.desc = '',
    this.actions,
    this.body,
    this.showCloseButton = true,
    this.scrollable = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      scrollable: scrollable,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      title: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          Visibility(
            visible: showCloseButton,
            child: Container(
              child: SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.highlight_off,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      content: body != null
          ? Container(
              width: Get.width,
              child: body,
              // color: Colors.red,
            )
          : ListBody(
              children: [
                Text(desc),
              ],
            ),
      actions: actions,
    );
  }
}
