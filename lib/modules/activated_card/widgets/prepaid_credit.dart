import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/home/home.dart';
import 'package:omny_business/shared/shared.dart';

class PrepaidCredit extends StatelessWidget {
  PrepaidCredit({
    Key? key,
  }) : super(key: key);
  // final double amount;

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: CommonConstants.hPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'prepaid_credit'.tr,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          AmountText(
            amount: controller.profile.value.balance,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
