import 'package:collnect/api/api.dart';
import 'package:collnect/models/models.dart';
import 'package:collnect/shared/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  RxDouble balance = 1000.0.obs;

  RxList<Feature> features = [
    new Feature(
      title: 'add_contacts'.tr,
      desc: 'add_contacts_desc'.tr,
      image: ImageConstants.addContact,
      route: Routes.HOME,
    ),
    new Feature(
      title: 'send_messages'.tr,
      desc: 'send_messages_desc'.tr,
      image: ImageConstants.sendMessage,
      route: Routes.HOME,
    ),
    new Feature(
      title: 'create_qr_code'.tr,
      desc: 'create_qr_code_desc'.tr,
      image: ImageConstants.createQrcode,
      route: Routes.HOME,
    ),
    new Feature(
      title: 'create_keyword'.tr,
      desc: 'create_keyword_desc'.tr,
      image: ImageConstants.keyboard,
      route: Routes.HOME,
    ),
    new Feature(
      title: 'send_gift_card'.tr,
      desc: 'send_gift_card_desc'.tr,
      image: ImageConstants.sendGiftCard,
      route: Routes.HOME,
      commingSoon: true,
    ),
    new Feature(
      title: 'create_gift_card'.tr,
      desc: 'create_gift_card_desc'.tr,
      image: ImageConstants.createGiftCard,
      route: Routes.HOME,
      commingSoon: true,
    ),
    new Feature(
      title: 'marketing_management'.tr,
      desc: 'marketing_management_desc'.tr,
      image: ImageConstants.marketingManagement,
      route: Routes.HOME,
      commingSoon: true,
    ),
  ].obs;

  RxList<Promotion> promotions = [
    new Promotion(
      image: ImageConstants.promotionBanner,
      route: Routes.HOME,
    ),
    new Promotion(
      image: ImageConstants.promotionBanner,
      route: Routes.HOME,
    ),
    new Promotion(
      image: ImageConstants.promotionBanner,
      route: Routes.HOME,
    )
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onLogin() async {}
}
