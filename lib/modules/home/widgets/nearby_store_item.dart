import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/store.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/widgets/widgets.dart';

import 'location_tag.dart';

class NearbyStoreItem extends StatelessWidget {
  const NearbyStoreItem({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.STORE_DETAIL, arguments: store),
      child: CustomCard(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoreDetailItem(store: store),
                  SpacingSm(),
                  _buildProductType(context)
                ],
              ),
            ),
            Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }

  Widget _buildProductType(BuildContext context) {
    return Row(
      children: [
        if (store.productCount! >= 1)
          LocationTag(
            text: 'reload'.tr,
            textColor: Colors.black,
            backgroundColor: ColorConstants.blueButtonBackgroundColor,
          ),
        if (store.productCount! > 1) ...[
          SizedBox(
            width: 4,
          ),
          LocationTag(text: 'activate'.tr)
        ],
      ],
    );
  }
}
