import 'dart:html';

import 'package:flutter/material.dart';
import 'package:omny_business/shared/utils/formatter.dart';

class AmountText extends StatelessWidget {
  const AmountText({
    Key? key,
    required this.amount,
    this.style,
  }) : super(key: key);
  final double amount;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${Formatter.formatLocaleMoney(amount)}',
      style: style,
    );
  }
}
