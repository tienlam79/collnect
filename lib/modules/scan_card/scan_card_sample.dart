import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';

class ScanCardSample extends StatelessWidget {
  const ScanCardSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertInfo(
      title: 'instruction'.tr,
      body: Container(
        child: Column(children: [
          Text('scan_omny_card_desc'.tr),
          SpacingSm(),
          Image.asset(
            ImageConstants.scanBarCodeSample,
          )
        ]),
      ),
    );
  }
}
