import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final ApiRepository apiRepository;
  ProfileController({required this.apiRepository});

  Rx<Profile> profile = new Profile().obs;

  Rx<Order> pendingPreOrder = new Order(
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
    getProfile();
    getPendingPreOrder();
  }

  void getProfile() async {
    try {
      var res = await apiRepository.getProfile();
      profile.value = res;
    } catch (error) {}
  }

  void getPendingPreOrder() async {
    try {
      var res = await apiRepository.getPendingPreOrder();
      if (res != null) {
        pendingPreOrder.value = res;
      } else {
        pendingPreOrder.value = new Order(
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
        );
      }
    } catch (error) {
      print('error.getPendingPreOrder.$error');
    }
  }

  void onLogout() async {
    var storage = Get.find<SharedPreferences>();
    var token = storage.getString(StorageConstants.token);
    final payload = new RefershTokenRequest(token: token);
    // var deviceId = storage.getString(StorageConstants.deviceId);
    try {
      await apiRepository.revokeToken(payload);
      storage.setString(StorageConstants.token, '');
      storage.setString(StorageConstants.refreshToken, '');
      // storage.setString(StorageConstants.xLatitude, '');
      // storage.setString(StorageConstants.xLongitude, '');

      Get.offAllNamed(Routes.LOGIN);
    } catch (error) {}
  }
}
