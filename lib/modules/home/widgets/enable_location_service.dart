import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';

class EnableLocationService extends StatelessWidget {
  const EnableLocationService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnablePermissionAlert(
      image: ImageConstants.locationPermision,
      enableButtonText: 'enable_location_service'.tr,
      desc: 'enable_location_service_desc'.tr,
      onEnable: goToSetting,
    );
  }

  void goToSetting() async {
    Get.back();
    Geolocator.openLocationSettings();
  }
}
