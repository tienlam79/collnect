import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';

class PreOrderDetailController extends GetxController {
  final ApiRepository apiRepository;
  PreOrderDetailController({required this.apiRepository});

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
  ).obs;
  @override
  void onInit() {
    super.onInit();
    Order args = Get.arguments;
    order.value = args;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
