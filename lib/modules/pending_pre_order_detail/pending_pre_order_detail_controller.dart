import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/modules/profile/profile_controller.dart';
import 'package:omny_locator/modules/profile/widgets/pre_order_history_controller.dart';

class PendingPreOrderDetailController extends GetxController {
  final ApiRepository apiRepository;
  PendingPreOrderDetailController({required this.apiRepository});

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
}
