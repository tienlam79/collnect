import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/utils/formatter.dart';
import 'package:omny_locator/shared/widgets/field/amount_field.dart';

import 'suggest_amount.dart';

class ProductAmount extends StatelessWidget {
  const ProductAmount({
    Key? key,
    required this.product,
    this.onChangeAmount,
    required this.amountController,
    required this.onSelectSuggestAmount,
    required this.selectedAmount,
    this.clipBehavior = Clip.none,
    this.maxWidth,
    this.hasBoxShadow = true,
  }) : super(key: key);
  final TextEditingController amountController;
  final Function(String?)? onChangeAmount;
  final Function onSelectSuggestAmount;
  final Product product;
  final RxDouble selectedAmount;
  final Clip clipBehavior;
  final double? maxWidth;
  final bool hasBoxShadow;

  @override
  Widget build(BuildContext context) {
    double minValue = product.minPrice;
    double maxValue = product.maxPrice;
    return Container(
      child: Column(
        children: [
          if (product.priceType == PriceType.OPEN)
            AmountField(
              controller: amountController,
              autofocus: true,
              onChanged: onChangeAmount,
              formatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                    Formatter.removeDecimalZeroFormat(maxValue).length),
              ],
              labelText: 'enter_load_amount'.trParams({
                'min': Formatter.removeDecimalZeroFormat(minValue),
                'max': Formatter.removeDecimalZeroFormat(maxValue),
              }),
            ),
          // if (product.priceType == PriceType.FIXED)
          // GrouapTile(title: 'select_amount'.tr),
          SuggestAmount(
            suggestAmounts: product.priceType == PriceType.OPEN
                ? product.suggestPriceList.obs
                : product.priceList.obs,
            onSelect: onSelectSuggestAmount,
            selectedAmount: selectedAmount,
            clipBehavior: clipBehavior,
            maxWidth: maxWidth,
            hasBoxShadow: hasBoxShadow,
          ),
        ],
      ),
    );
  }
}
