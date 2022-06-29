import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/result/result.dart';
import 'package:omny_business/routes/routes.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:omny_business/shared/widgets/common/custom_card.dart';

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
          _buildFee(context)
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.check_circle,
            size: 40, color: ColorConstants.secondaryButtonBackgroundColor),
        SpacingSm(),
        Text('successfully'.tr, style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: 4,
        ),
        Obx(
          () => Text(
              'transaction_id'.trParams({'id': '${controller.order.value.id}'}),
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
            value: controller.order.value.topupPhone,
          ),
          ItemTile(
            title: 'name'.tr,
            value: controller.order.value.topupName,
          )
        ],
      ),
    );
  }

  Widget _buildCardNumber(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          ItemTile(
            title: 'omny_card_prefix'.tr,
            value: controller.order.value.prefixCardNumber,
          ),
          ItemTile(
            title: 'omny_card_number'.tr,
            value: controller.order.value.cardNumber,
          )
        ],
      ),
    );
  }

  Widget _buildFee(BuildContext context) {
    return FeeCard(
      amount: controller.order.value.amount,
      fee: 10.0,
    );
  }
}
