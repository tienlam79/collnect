import 'package:flutter/material.dart';
import 'package:omny_business/shared/constants/common.dart';
import 'package:omny_business/shared/utils/formatter.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    Key? key,
    required this.total,
    this.label = 'total_amount',
  }) : super(key: key);
  final String total;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
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
