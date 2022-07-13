import 'package:geolocator/geolocator.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/order.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/widgets/enable_location_service.dart';

class ResultController extends GetxController {
  final ApiRepository apiRepository;
  ResultController({
    required this.apiRepository,
  });

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
  @override
  void onInit() {
    super.onInit();
    Order args = Get.arguments;
    order.value = args;
    getOrder();
  }

  void getOrder() async {
    try {
      Order args = Get.arguments;
      final res = await apiRepository.getPreOrder(args.id);
      order.value = res;
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
