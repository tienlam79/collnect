import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/order.dart';

class ResultController extends GetxController {
  final ApiRepository apiRepository;
  ResultController({
    required this.apiRepository,
  });

  Rx<Order> order = new Order(
    id: 12345678,
    topupPhone: '6786349090',
    topupName: 'John',
    amount: 20.0,
    cardNumber: '79936690000000',
    prefixCardNumber: '1234567890',
  ).obs;
  @override
  void onInit() {
    super.onInit();
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
