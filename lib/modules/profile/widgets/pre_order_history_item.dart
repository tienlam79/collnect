import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';

class PreOrderHistoryItem extends StatelessWidget {
  const PreOrderHistoryItem({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _buildContent(context),
      onTap: () => Get.toNamed(
        Routes.PRE_ORDER_DETAIL,
        arguments: order,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonConstants.hPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('omny_card_number'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: ColorConstants.lightLabelInputColor)),
                Text(order.productPin,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.bold, height: 1.5)),
                SizedBox(
                  height: 4,
                ),
                Text(
                    DateFormat('MM-dd-yyyy').format(
                      order.createdAt ?? DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14, color: Colors.black.withOpacity(0.5))),
              ],
            ),
          ),
          Row(
            children: [
              GradientText(
                '\$${Formatter.formatLocaleMoney(order.amount)}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(
                alignment: Alignment.centerRight,
                // color: Colors.red,
                child: Icon(
                  Icons.navigate_next,
                  size: 30,
                  color: ColorConstants.lightSecodaryTextColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
