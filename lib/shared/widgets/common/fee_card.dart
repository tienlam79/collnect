import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';


class FeeCard extends StatelessWidget {
  FeeCard({
    Key? key,
    required this.amount,
    required this.fee,
    this.amountLabel,
    this.feeLabel,
    this.totalLabel,
  }) : super(key: key);
  final double fee;
  final double amount;
  final String? amountLabel;
  final String? feeLabel;
  final String? totalLabel;

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
              amountLabel ?? 'load_amount'.tr,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: AmountText(
              amount: amount,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                feeLabel ?? 'insurance_fee'.tr,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: AmountText(
                amount: fee,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
          SpacingXs(),
          Divider(),
          SpacingXs(),
          TotalAmount(
            total: '$total',
            label: totalLabel ?? 'total_amount'.tr,
          ),
        ],
      ),
    );
  }
}
