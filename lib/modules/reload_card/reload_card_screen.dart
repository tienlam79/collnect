import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/reload_card/reload_card.dart';
import 'package:omny_business/routes/app_pages.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';

class ReloadCardScreen extends GetView<ReloadCardController> {
  const ReloadCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'reload_card'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: CommonConstants.hPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'prepaid_credit'.tr,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '\$500',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
      footer: Obx(
        () => Visibility(
          visible: controller.code.value != '',
          child: SecondaryButton(
            onPressed: () => Get.toNamed(Routes.RESULT),
            disabled: controller.selectedAmount.value == 0.0,
            text: 'reload_card'.tr,
          ),
        ),
      ),
      child: Obx(
        () => controller.isShowScanBarCodeForm.value
            ? _buildScanBarCodeForm(context)
            : _buildEnterPhoneForm(context),
      ),
    );
  }

  Widget _buildEnterPhoneForm(BuildContext context) {
    return Column(
      children: [
        PhoneField(
          controller: controller.phoneController,
          labelText: 'customer_phone_number'.tr,
        ),
        InputField(
          controller: controller.nameController,
          labelText: 'name_optional'.tr,
        ),
        SpacingSm(),
        Obx(
          () => GradientButton(
            text: 'next'.tr,
            disabled: controller.phoneText.value.length < 10,
            onPressed: controller.onNext,
          ),
        ),
      ],
    );
  }

  Widget _buildScanBarCodeForm(BuildContext context) {
    return Column(
      children: [
        ItemTile(
          title: 'customer_phone_number'.tr,
          value: controller.phoneController.text,
          titleStyle: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: ColorConstants.lightSecodaryTextColor),
          valueStyle: TextStyle(
            fontSize: 36,
            height: CommonConstants.lineHeight,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (controller.nameText.value != '')
          ItemTile(
            title: 'name'.tr,
            value: controller.nameText.value,
            titleStyle: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorConstants.lightSecodaryTextColor),
            valueStyle: TextStyle(
              fontSize: 30,
              height: CommonConstants.lineHeight,
              fontWeight: FontWeight.bold,
            ),
          ),
        SpacingSm(),
        _buildProductInputAmount(context),
        // Obx(
        //   () => controller.code.value != ''
        //       ? _buildProductInputAmount(context)
        //       : _buildScanBarCodeButton(context),
        // ),
      ],
    );
  }

  Widget _buildPrefixCardNumberField(BuildContext context) {
    return NumberField(
      controller: controller.prefixCardNumberController,
      labelText: 'omny_card_prefix'.tr,
      maxLines: 1,
      enabled: false,
    );
  }

  Widget _buildCardNumberField(BuildContext context) {
    return NumberField(
      controller: controller.cardNumberController,
      labelText: 'omny_card_number'.tr,
      maxLines: 1,
      suffixIconConstraints: BoxConstraints(
        minWidth: CommonConstants.iconSize,
        minHeight: CommonConstants.iconSize,
      ),
      // style: TextStyle(
      //   fontSize: 23,
      //   fontWeight: FontWeight.w600,
      // ),
      suffixIcon: InkWell(
        child: Image.asset(
          ImageConstants.barCodeDarkIcon,
          width: CommonConstants.iconSize,
          height: CommonConstants.iconSize,
        ),
        onTap: () => Get.toNamed(Routes.SCAN_CARD, arguments: controller),
      ),
    );
  }

  Widget _buildProductInputAmount(BuildContext context) {
    return Column(
      children: [
        _buildPrefixCardNumberField(context),
        _buildCardNumberField(context),
        ProductAmount(
          amountController: controller.amountController,
          selectedAmount: controller.selectedAmount,
          product: controller.product.value,
          onSelectSuggestAmount: controller.onSelectAmount,
        ),
        Obx(
          () => Visibility(
            child: Column(
              children: [
                SpacingSm(),
                TotalAmount(total: '${controller.selectedAmount.value}'),
              ],
            ),
            visible: controller.selectedAmount.value != 0.0,
          ),
        )
      ],
    );
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
