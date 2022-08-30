import 'package:collnect/modules/home/home_controller.dart';
import 'package:collnect/modules/home/widgets/home_banner.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

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
            width: Get.width,
            height: Get.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(ImageConstants.homeBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: []),
          ),
        ],
      ),
    );
  }
}
