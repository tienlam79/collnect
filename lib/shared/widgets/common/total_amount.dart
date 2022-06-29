import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/constants/common.dart';
import 'package:omny_business/shared/utils/formatter.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    Key? key,
    required this.total,
  }) : super(key: key);
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'total_amount'.tr,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          '\$${Formatter.removeDecimalZeroFormat(double.parse(total))}',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            height: CommonConstants.lineHeight,
          ),
        )
      ],
    );
  }
}
