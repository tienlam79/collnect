import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  Rx<Profile> profile = new Profile().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProfile() async {
    try {
      var res = await apiRepository.getProfile();
      profile.value = res;
    } catch (error) {}
  }
}
