import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/widgets/alert/alert_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

import 'widgets/enable_location_service.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  Rx<Profile> profile = new Profile().obs;
  Rx<Position> positon = new Position(
    longitude: 0.0,
    latitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    checkLocation();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProfile() async {
    try {
      var res = await apiRepository.getProfile();
      profile.value = res;
    } catch (error) {}
  }

  void enableLocationDialog() {
    Get.dialog(
      AlertInfo(
        body: EnableLocationService(),
        showCloseButton: false,
      ),
      barrierDismissible: false,
    );
  }

  void checkLocation() async {
    var status = await Permission.location.status;
    if (status.isPermanentlyDenied) {
      enableLocationDialog();
      return;
    }
    if (!status.isGranted) {
      var status = await Permission.locationWhenInUse.request();
      if (status.isGranted) {
        final p = await Geolocator.getCurrentPosition();
        positon.value = p;
        return;
        // return Get.toNamed(Routes.NEARBY_STORES, arguments: [position]);
      } else {
        Get.snackbar(
          "Permisson Denied",
          "Please enable camera to scan barcodes",
        );
        return;
      }
    } else {
      final p = await Geolocator.getCurrentPosition();
      positon.value = p;
      return;
      // return Get.toNamed(Routes.NEARBY_STORES, arguments: [position]);
    }
  }
}
