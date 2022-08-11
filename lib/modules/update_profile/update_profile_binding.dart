import 'package:get/get.dart';
import 'package:omny_locator/modules/update_profile/update_profile_controller.dart';

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(
        () => UpdateProfileController(apiRepository: Get.find()));
  }
}
