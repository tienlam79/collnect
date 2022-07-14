import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/store.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/shared.dart';

import 'store_detail_controller.dart';
import 'widgets/reviews.dart';

class StoreDetailScreen extends GetView<StoreDetailController> {
  const StoreDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'store_detail'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      bodyPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.toNamed(Routes.COMMENT, arguments: controller.store.value),
        backgroundColor: ColorConstants.lightButtonBackgroundColor,
        child: const Icon(Icons.rate_review, color: Colors.white),
      ),
      child: Column(
        children: [
          Image.asset(
            ImageConstants.map,
            height: 264,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.primaryColor.withOpacity(0.2),
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.all(CommonConstants.hPadding),
            child: Column(
              children: [
                Obx(
                  () => StoreDetailItem(store: controller.store.value),
                ),
                SpacingMd(),
                _buildButtonActions(context),
              ],
            ),
          ),
          Obx(
            () => StoreReviews(store: controller.store.value),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonActions(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: GradientButton(
            onPressed: () => MapUtils.openMap(
              controller.store.value.latitude,
              controller.store.value.longitude,
            ),
            height: 40,
            radius: 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions, color: Colors.white),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'directions'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          flex: 2,
          child: OutlinedGradientButton(
            onPressed: controller.onFavorite,
            height: 40,
            radius: 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Icon(
                      controller.store.value.like == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ColorConstants.primaryColor),
                ),
                SizedBox(
                  width: 4,
                ),
                GradientText('like'.tr,
                    style: Theme.of(context).textTheme.subtitle1)
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          flex: 2,
          child: OutlinedGradientButton(
            height: 40,
            radius: 14,
            onPressed: controller.onShareStore,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share, color: ColorConstants.primaryColor),
                SizedBox(
                  width: 4,
                ),
                GradientText('share'.tr,
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
