import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/activated_card/activated_card_controller.dart';
import 'package:omny_locator/modules/activated_card/widgets/customer_info.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/utils/helpers.dart';
import 'widgets/prepaid_credit.dart';

class ScanBarCode extends StatelessWidget {
  ScanBarCode({Key? key}) : super(key: key);

  final ActivatedCardController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'activated_new_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit()],
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
        onPressed: () => Helpers.checkCameraPermission(context, controller),
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
        child: GradientText('enter_manual_omny_card_number'.tr),
      ),
    ]);
  }
}
