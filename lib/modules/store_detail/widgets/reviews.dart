import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/store.dart';
import 'package:omny_locator/modules/store_detail/widgets/review_controller.dart';
import 'package:omny_locator/modules/store_detail/widgets/review_item.dart';
import 'package:omny_locator/shared/shared.dart';

class StoreReviews extends StatelessWidget {
  final ReviewController controller;
  final Store store;
  StoreReviews({
    Key? key,
    required this.store,
  }) : controller = Get.put(ReviewController(
          apiRepository: Get.find(),
          store: store,
        ));
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.total.value > 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CommonConstants.hPadding, vertical: 20),
              child: Text(
                '${store.reviewCount} reviews',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              controller: controller.scrollController,
              itemCount: controller.reviews.length,
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: CommonConstants.hPadding),
                child: Divider(
                  height: 5,
                  thickness: 5,
                  color: hexToColor('#E0E0E0'),
                ),
              ),
              itemBuilder: (BuildContext context, int index) => ReviewItem(
                review: controller.reviews[index],
                onRatingReview: controller.onChangeRating,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
