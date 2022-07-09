import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/alert/alert_info.dart';

class Helpers {
  // static double? getDestAmount(Product product, double amount) {
  //   List<double> priceList = product.priceType == PriceType.OPEN
  //       ? product.suggestPriceList
  //       : product.priceList;
  //   int priceIndex = priceList.indexWhere((element) => amount == element);
  //   return priceIndex != -1 ? product.destAmountList[priceIndex] : null;
  // }

  static bool checkValidAmount(Product product, double amount) {
    if (product.priceType == PriceType.OPEN) {
      return amount != 0.0 &&
          amount >= (product.minPrice) &&
          amount <= (product.maxPrice);
    }
    return amount != 0.0;
  }

  static checkCameraPermission(BuildContext context, dynamic controller) async {
    var status = await Permission.camera.status;
    if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertInfo(
          body: Container(),
          // body: EnableCameraPermission(),
          showCloseButton: false,
        ),
      );
      return;
    }
    if (!status.isGranted) {
      final result = await Permission.camera.request();

      if (result.isGranted) {
        Get.toNamed(Routes.SCAN_CARD, arguments: controller);
      } else {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) => AlertInfo(
        //     body: EnableCameraPermission(),
        //     showCloseButton: false,
        //   ),
        // );
        Get.snackbar(
          "Permisson Denied",
          "Please enable camera to scan barcodes",
        );
      }
    } else {
      Get.toNamed(Routes.SCAN_CARD, arguments: controller);
    }
  }
}
