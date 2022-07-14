import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';

class PendingPreOrder extends StatelessWidget {
  PendingPreOrder({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(text: 'pending_pre_order'.tr),
        SpacingXs(),
        _buildCard(context),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              QrCodeWrapper(
                size: 95.0,
                value:
                    '${order.id}-${order.customerPhone}-${order.customerName}-${order.amount}',
              ),
              SizedBox(
                width: CommonConstants.hPadding,
              ),
              Expanded(
                child: Column(
                  children: [
                    ItemTile(
                      title: 'omny_card_number'.tr,
                      value: order.productPin,
                    ),
                    ItemTile(
                      title: 'amount'.tr,
                      value: '\$${Formatter.formatLocaleMoney(order.amount)}',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SpacingSm(),
          GradientButton(
            text: 'detail'.tr,
            onPressed: () => Get.toNamed(
              Routes.PENDING_PRE_ORDER_DETAIL,
              arguments: order,
            ),
          ),
        ],
      ),
    );
  }
}
