import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/constants/colors.dart';
import 'package:omny_business/shared/constants/common.dart';
import 'package:omny_business/shared/widgets/widgets.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({
    Key? key,
    required this.phoneNumber,
    required this.name,
  }) : super(key: key);

  final String phoneNumber;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTile(
          title: 'customer_phone_number'.tr,
          value: phoneNumber,
          titleStyle: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: ColorConstants.lightLabelInputColor),
          valueStyle: TextStyle(
            fontSize: 36,
            height: CommonConstants.lineHeight,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (name != '')
          ItemTile(
            title: 'name'.tr,
            value: name,
            titleStyle: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorConstants.lightLabelInputColor),
            valueStyle: TextStyle(
              fontSize: 30,
              height: CommonConstants.lineHeight,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
