import 'package:collnect/api/api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  RxDouble balance = 1000.0.obs;

  // RxList<Fea> options

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

  void onLogin() async {}
}
