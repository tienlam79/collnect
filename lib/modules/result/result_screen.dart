import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/enum_values/card_type.dart';
import 'package:omny_locator/modules/result/result.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/widgets/common/custom_card.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      showBackIcon: false,
      footer: GradientButton(
        text: 'back_to_home'.tr,
        onPressed: () => Get.toNamed(Routes.HOME),
      ),
      titleText: 'result'.tr,
      child: Column(
        children: [
          _buildHeader(context),
          SpacingMd(),
          _buildCardNumber(context),
          SpacingSm(),
          _buildQrCode(context),
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
        Text('pre_order_omny_card_successful'.tr,
            style: Theme.of(context).textTheme.headline5),
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
          if (controller.order.value.product.productFilter ==
              CardType.RELOAD) ...[
            SpacingSm(),
            TotalAmount(
                total: controller.order.value.amount.toString(),
                label: 'reload_amount'.tr)
          ]
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
        Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
          ),
          child: QrImage(
            data:
                '${controller.order.value.id}-${controller.order.value.customerPhone}-${controller.order.value.customerName}-${controller.order.value.amount}',
            version: QrVersions.auto,
            padding: EdgeInsets.zero,
            size: 150.0,
          ),
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
