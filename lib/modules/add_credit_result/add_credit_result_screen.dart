import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/add_credit_result/add_credit_result_controller.dart';
import 'package:omny_locator/modules/home/home.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/shared/widgets/common/custom_card.dart';

class AddCreditResultScreen extends GetView<AddCreditResultController> {
  AddCreditResultScreen({Key? key}) : super(key: key);

  final HomeController homeControllter = Get.find();
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
          CustomCard(
            child: ItemTile(
              title: 'your_business_id'.tr,
              value: homeControllter.profile.value.username ?? '',
            ),
          ),
          SpacingXs(),
          FeeCard(
            amount: controller.order.value.amount,
            fee: controller.order.value.fee,
            amountLabel: 'credit_reload'.tr,
            feeLabel: 'service_fee_type'.trParams({
              'type': controller.order.value.type,
            }),
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
}
