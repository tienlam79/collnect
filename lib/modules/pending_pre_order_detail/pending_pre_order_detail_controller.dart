import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/modules/home/widgets/enable_location_service.dart';
import 'package:omny_locator/modules/profile/profile_controller.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class PendingPreOrderDetailController extends GetxController {
  final ApiRepository apiRepository;
  PendingPreOrderDetailController({required this.apiRepository});
  var storage = Get.find<SharedPreferences>();

  Rx<Order> order = new Order(
    id: 0,
    cid: '',
    productPin: '',
    amount: 0.0,
    baseAmount: 0.0,
    fee: 0.0,
    productPrefix: '',
    status: '',
    customerName: '',
    customerPhone: '',
    product: new OrderProduct(name: ''),
    retailerId: 0,
  ).obs;

  final ProfileController profileController = Get.find();
  @override
  void onInit() {
    super.onInit();
    Order args = Get.arguments;
    order.value = args;
  }

  void onCancel() async {
    try {
      await apiRepository.cancelPendingPreOrder(order.value.id);
      profileController
          .getPendingPreOrder(); // preOrderHistoryController.getPreOrderHistories(1);
      Get.back();
    } catch (error) {}
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
        Get.toNamed(Routes.NEARBY_STORE);

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
      Get.toNamed(Routes.NEARBY_STORE);
      return;
    }
  }
}
