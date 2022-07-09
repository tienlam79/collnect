import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/enum_values/card_type.dart';
import 'package:omny_locator/modules/result/result.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/widgets/common/custom_card.dart';

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
          _buildCustomerInfo(context),
          SpacingXs(),
          _buildCardNumber(context),
          SpacingXs(),
          if (controller.order.value.fee != 0.0) _buildFee(context)
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
        Text('successfully'.tr, style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: 4,
        ),
        Obx(
          () => Text(
              'transaction_id'
                  .trParams({'id': '${controller.order.value.transactionId}'}),
              style: Theme.of(context).textTheme.subtitle1),
        ),
      ],
    );
  }

  Widget _buildCustomerInfo(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          ItemTile(
            title: 'customer_phone_number'.tr,
            value: Formatter.formatPhoneNumber(
                controller.order.value.customerPhone,
                CommonConstants.USCountryCode),
          ),
          ItemTile(
            title: 'name'.tr,
            value: controller.order.value.customerName,
          )
        ],
      ),
    );
  }

  Widget _buildCardNumber(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          if (controller.order.value.product.productFilter ==
              CardType.ACTIVATION)
            ItemTile(
              title: 'omny_card_prefix'.tr,
              value: controller.order.value.product.name,
            ),
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

  Widget _buildFee(BuildContext context) {
    return FeeCard(
      amount: controller.order.value.amount,
      fee: controller.order.value.fee,
    );
  }
}
