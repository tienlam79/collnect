import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/enum_values/card_type.dart';
import 'package:omny_business/models/enum_values/order_status.dart';
import 'package:omny_business/models/order.dart';

class ResultController extends GetxController {
  final ApiRepository apiRepository;
  ResultController({
    required this.apiRepository,
  });

  Rx<Order> order = new Order(
    id: 0,
    cid: '',
    productPin: '',
    amount: 0.0,
    baseAmount: 0.0,
    fee: 0.0,
    transactionId: 0,
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

  void getOrder() {}
}
