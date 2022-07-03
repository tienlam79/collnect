import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';

class AddCreditResultController extends GetxController {
  final ApiRepository apiRepository;
  AddCreditResultController({
    required this.apiRepository,
  });
  Rx<AchOrder> order = new AchOrder(
    id: 0,
    cid: '',
    amount: 0.0,
    fee: 0.0,
    type: '',
    status: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    AchOrder args = Get.arguments;
    order.value = args;
  }
}
