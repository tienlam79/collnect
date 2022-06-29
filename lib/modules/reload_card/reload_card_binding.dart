import 'package:get/get.dart';
import 'package:omny_business/modules/reload_card/reload_card.dart';

class ReloadCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReloadCardController>(
        () => ReloadCardController(apiRepository: Get.find()));
  }
}
