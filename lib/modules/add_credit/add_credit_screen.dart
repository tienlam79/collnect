import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/modules/add_credit/add_credit_controller.dart';
import 'package:omny_business/modules/home/home.dart';
import 'package:omny_business/shared/shared.dart';

import '../activated_card/widgets/prepaid_credit.dart';

class AddCreditScreen extends GetView<AddCreditController> {
  AddCreditScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'reload_credit'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      actions: [PrepaidCredit()],
      footer: Obx(
        () => SecondaryButton(
          onPressed: controller.onSubmit,
          disabled: controller.amount.value == 0.0 ||
              controller.selectedOption.value.order == 0,
          text: 'submit'.tr,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemTile(
            title: 'your_business_id'.tr,
            value: homeController.profile.value.username ?? '',
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
          SpacingSm(),
          AmountField(
            labelText: 'enter_reload_amount'.tr,
            controller: controller.amountController,
            autofocus: true,
          ),
          SpacingSm(),
          Obx(
            () => Visibility(
              visible: controller.options.length > 0,
              child: _buildReloadPlan(context),
            ),
          ),
          SpacingMd(),
          Obx(
            () => Visibility(
              child: FeeCard(
                amount: controller.amount.value,
                fee: controller.selectedOption.value.fee,
                amountLabel: 'credit_reload'.tr,
                feeLabel: 'service_fee'.tr,
              ),
              visible: controller.amount.value != 0.0 &&
                  controller.selectedOption.value.order != 0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReloadPlan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'select_reload_plan'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: ColorConstants.lightSecodaryTextColor),
        ),
        SpacingXs(),
        Obx(
          () => ListView.separated(
            itemBuilder: _buildAchOption,
            itemCount: controller.options.length,
            shrinkWrap: true,
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            separatorBuilder: (BuildContext context, int index) => SpacingXs(),
          ),
        ),
      ],
    );
  }

  Widget _buildAchOption(BuildContext context, int index) {
    AchOption option = controller.options[index];
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: controller.selectedOption.value.type == option.type
              ? Border.all(
                  color: hexToColor('#99B2FE'),
                  width: 2,
                )
              : null,
          boxShadow: controller.selectedOption.value.type == option.type
              ? [
                  BoxShadow(
                    color: hexToColor('#99B2FE'),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: ListTile(
          onTap: () => controller.onSelectOption(option),
          horizontalTitleGap: 0,
          leading: SizedBox(
            width: 30,
            child: Center(
              child: GradientRadio(
                value: option.type,
                groupValue: controller.selectedOption.value.type,
                onChanged: (item) {},
              ),
            ),
          ),
          title: Text(
            option.name,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(option.description ?? '',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColorConstants.lightSecodaryTextColor,
                    fontSize: 14,
                  )),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('fee'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: ColorConstants.lightSecodaryTextColor)),
              AmountText(
                amount: option.fee,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
