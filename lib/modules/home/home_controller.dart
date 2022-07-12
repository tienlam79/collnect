import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/storage.dart';
import 'package:omny_locator/shared/widgets/alert/alert_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/enable_location_service.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});
  var storage = Get.find<SharedPreferences>();

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
    var status = await Permission.locationWhenInUse.status;
    if (status.isPermanentlyDenied) {
      Get.dialog(
        AlertInfo(
          body: EnableLocationService(),
          showCloseButton: false,
        ),
        barrierDismissible: false,
      );
      return;
    }
    if (!status.isGranted) {
      var status = await Permission.locationWhenInUse.request();
      if (status.isGranted) {
        final p = await Geolocator.getCurrentPosition();
        storage.setString(StorageConstants.xLatitude, '${p.latitude}');
        storage.setString(StorageConstants.xLongitude, '${p.longitude}');
        positon.value = p;
        print('...get location...${p.toJson()}');
        return;
      } else {
        Get.snackbar(
          "Permisson Denied",
          "Please enable location to get nearby store",
        );
        return;
      }
    } else {
      final p = await Geolocator.getCurrentPosition();
      storage.setString(StorageConstants.xLatitude, '${p.latitude}');
      storage.setString(StorageConstants.xLongitude, '${p.longitude}');
      print('...get location...${p.toJson()}');
      positon.value = p;
      return;
    }
  }
}
