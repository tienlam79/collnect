import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/activated_card/activated_card_controller.dart';
import 'package:omny_business/modules/activated_card/widgets/customer_info.dart';
import 'package:omny_business/routes/app_pages.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'widgets/prepaid_credit.dart';

class ScanBarCode extends StatelessWidget {
  ScanBarCode({Key? key}) : super(key: key);

  final ActivatedCardController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'activated_new_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit(amount: 500.0)],
      child: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        CustomerInfo(
          phoneNumber: controller.phoneController.text,
          name: controller.nameText.value,
        ),
        SpacingSm(),
        _buildScanBarCodeButton(context),
      ],
    );
  }

  Widget _buildScanBarCodeButton(BuildContext context) {
    return Column(children: [
      GradientButton(
        height: 100,
        onPressed: () => getCameraPermission(context),
        child: ListTile(
          leading: Image.asset(
            ImageConstants.barCodeWhiteIcon,
            width: 32,
            height: 32,
          ),
          title: Text(
            'scan_bar_code'.tr,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 25,
                  color: Colors.white,
                ),
          ),
        ),
      ),
      TextButton(
        onPressed: controller.setManual,
        child: Text('enter_manual_omny_card_number'.tr),
      ),
    ]);
  }

  void getCameraPermission(BuildContext context) async {
    var status = await Permission.camera.status;
    if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertInfo(
          body: Container(),
          // body: EnableCameraPermission(),
          showCloseButton: false,
        ),
      );
      return;
    }
    if (!status.isGranted) {
      final result = await Permission.camera.request();

      if (result.isGranted) {
        Get.toNamed(Routes.SCAN_CARD, arguments: controller);
      } else {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) => AlertInfo(
        //     body: EnableCameraPermission(),
        //     showCloseButton: false,
        //   ),
        // );
        Get.snackbar(
          "Permisson Denied",
          "Please enable camera to scan barcodes",
        );
      }
    } else {
      Get.toNamed(Routes.SCAN_CARD, arguments: controller);
    }
  }
}
