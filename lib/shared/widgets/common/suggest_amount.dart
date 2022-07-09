import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';

class SuggestAmount extends StatelessWidget {
  final RxList<double> suggestAmounts;
  final Function onSelect;
  final RxDouble selectedAmount;
  final Clip clipBehavior;
  final double? maxWidth;
  final bool hasBoxShadow;
  const SuggestAmount({
    Key? key,
    required this.suggestAmounts,
    required this.onSelect,
    required this.selectedAmount,
    this.clipBehavior = Clip.none,
    this.maxWidth,
    this.hasBoxShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (suggestAmounts.length == 0) {
      return Container();
    }
    return Container(
      height: 48,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          itemCount: suggestAmounts.length,
          itemBuilder: _buildItemAmount,
          clipBehavior: clipBehavior,
          padding: EdgeInsets.zero,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: index < suggestAmounts.length - 1 ? 8 : 0,
          ),
        ),
      ),
    );
  }

  Widget _buildItemAmount(BuildContext context, int index) {
    var amount = suggestAmounts[index];
    double minWidth = ((maxWidth ?? Get.width) -
            (CommonConstants.hPadding * 2) -
            ((suggestAmounts.length - 1) * 8)) /
        suggestAmounts.length;
    return Obx(
      () => InkWell(
        onTap: () => onSelect(amount),
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 50.0,
            minWidth: max(minWidth, 60),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            // width: (Get.width - 40 - ((suggestAmounts.length - 1) * 10)) /
            //     suggestAmounts.length,
            // margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selectedAmount.value == amount
                  ? ColorConstants.primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GradientText(
              '\$${Formatter.removeDecimalZeroFormat(amount)}',
              gradient: selectedAmount.value == amount
                  ? CommonConstants.secondaryGradientColors
                  : CommonConstants.primaryGradientColors,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
