import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omny_locator/modules/pre_order_detail/pre_order_detail_controller.dart';
import 'package:omny_locator/shared/shared.dart';

class PreOrderDetailScreen extends GetView<PreOrderDetailController> {
  const PreOrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleSpacing: CommonConstants.titleSpacing,
      titleText: 'reload_detail'.tr,
      footer: GradientButton(
        text: 'pre_reload_again'.tr,
        // onPressed: () => Get.toNamed(Routes.HOME),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          SpacingSm(),
          _buildCardNumber(context),
          SpacingSm(),
          Obx(
            () => controller.store.value.id != 0
                ? StoreDetailItem(
                    store: controller.store.value,
                    storeNamePrefix: 'reload_at'.tr,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          size: 40,
          color: ColorConstants.lightButtonBackgroundColor,
        ),
        SpacingSm(),
        Text('reload_completed'.tr,
            style: Theme.of(context).textTheme.headline5),
        SpacingXs(),
        Text('Transaction ID: ${controller.order.value.transactionId}',
            style: Theme.of(context).textTheme.subtitle1),
        Text(
            DateFormat('HH:mm MM-dd-yyyy').format(
              controller.order.value.createdAt ?? DateTime.now(),
            ),
            style: Theme.of(context).textTheme.subtitle1)
      ],
    );
  }

  Widget _buildCardNumber(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          ItemTile(
            title: 'omny_card_number'.tr,
            value: controller.order.value.productPin,
          ),
          SpacingSm(),
          TotalAmount(
            total: controller.order.value.amount.toString(),
            label: 'reload_amount'.tr,
          )
        ],
      ),
    );
  }

  Widget _buildQrCode(BuildContext context) {
    return Column(
      children: [
        Text(
          'show_qr_code_desc'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SpacingSm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.homeIcon,
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 8,
            ),
            GradientText(
              'find_location_near_you'.tr,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        SpacingMd(),
        QrCodeWrapper(
          size: 150.0,
          value:
              '${controller.order.value.id}-${controller.order.value.customerPhone}-${controller.order.value.customerName}-${controller.order.value.amount}',
        ),
        SpacingXs(),
        TextButton(
          onPressed: () => {},
          child: Text(
            'save_qr_code'.tr,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorConstants.primaryColor),
          ),
        ),
        Text(
          'find_qr_code'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
  }
}
