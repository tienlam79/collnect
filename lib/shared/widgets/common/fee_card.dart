import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../spacing/spacing_xs.dart';
import 'custom_card.dart';
import 'total_amount.dart';

class FeeCard extends StatelessWidget {
  FeeCard({
    Key? key,
    required this.amount,
    required this.fee,
  }) : super(key: key);
  final double fee;
  final double amount;

  @override
  Widget build(BuildContext context) {
    double total = amount + fee;
    return CustomCard(
      child: Column(
        children: [
          ListTile(
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'load_amount'.tr,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Text(
              '\$$amount',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'insurance_fee'.tr,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: Text(
                '\$$fee',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
          SpacingXs(),
          Divider(),
          SpacingXs(),
          TotalAmount(total: '$total'),
        ],
      ),
    );
  }
}
