import 'home_controller.dart';
import 'widgets/home_banner.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_features.dart';
import 'widgets/home_promotions.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey =
        GlobalKey<ScaffoldState>(debugLabel: 'GlobalFormKey #SignIn');
    return Scaffold(
      primary: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('credit'.tr),
              Text(
                '\$${Formatter.formatLocaleMoney(controller.balance.value)}',
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.message,
            ),
            onPressed: () => {},
          ),
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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            if (_scaffoldKey.currentState!.isDrawerOpen == false) {
              _scaffoldKey.currentState!.openDrawer();
            } else {
              _scaffoldKey.currentState!.openEndDrawer();
            }
          },
        ),
      ),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: HomeDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeBanner(),
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height / 1.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConstants.homeBg),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                        SpacingXs(),
                        HomeFeatures(
                          features: controller.features,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
