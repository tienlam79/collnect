import 'home_controller.dart';
import 'widgets/home_banner.dart';
import 'widgets/home_features.dart';
import 'widgets/home_promotions.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  get callbackFunction => null;

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      showBackIcon: false,
      bodyPadding: const EdgeInsets.all(0),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => {},
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('credit'.tr),
            Text('\$${Formatter.formatLocaleMoney(controller.balance.value)}'),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.message,
          ),
          onPressed: () => {},
        ),
        Text('tienlam'),
        TextButton(
          onPressed: () => {},
          child: Row(
            children: [
              Text('Tien'),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
      child: Column(
        children: [
          HomeBanner(),
          Container(
            padding: const EdgeInsets.all(CommonConstants.hPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomePromotions(
                  promotions: controller.promotions,
                ),
                SpacingSm(),
                Text(
                  'feature_title'.tr,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      // color: Colors.white,
                      ),
                ),
                HomeFeatures(
                  features: controller.features,
                ),
              ],
            ),
          ),
          // Expanded(child: Container()),
          // Container(
          //   padding: const EdgeInsets.all(CommonConstants.hPadding),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(ImageConstants.homeBg),
          //       fit: BoxFit.cover,
          //       alignment: Alignment.topCenter,
          //     ),
          //   ),
          //   child: Column(
          //     children: [
          //       HomeFeatures(
          //         features: controller.features,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
