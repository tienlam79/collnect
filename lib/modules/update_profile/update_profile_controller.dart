import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/api/api_repository.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/modules/home/home.dart';
import 'package:omny_locator/modules/profile/profile_controller.dart';
import 'package:omny_locator/shared/constants/common.dart';
import 'package:omny_locator/shared/utils/utils.dart';

class UpdateProfileController extends GetxController {
  final ApiRepository apiRepository;
  UpdateProfileController({
    required this.apiRepository,
  });

  Rx<Profile> profile = new Profile().obs;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  final ProfileController profileController = Get.find();
  final HomeController homeController = Get.find();

  RxString name = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();

    nameController.addListener(() {
      name.value = nameController.text.trim();
    });
  }

  void getProfile() async {
    try {
      var res = await apiRepository.getProfile();
      profile.value = res;
      String fullName = '${res.firstName} ${res.lastName}';
      name.value = fullName;
      nameController.text = fullName;
      phoneController.text = Formatter.formatPhoneNumber(
          res.username ?? '', CommonConstants.USCountryCode);
    } catch (error) {}
  }

  void updateProfile() async {
    try {
      var str = nameController.text.split(' ');
      String firstName = str[0];
      String lastName = nameController.text.replaceFirst(firstName, '');
      final payload = UpdateProfileRequest(
        firstName: firstName,
        lastName: lastName,
      );
      await apiRepository.updateProfile(payload);
      profileController.getProfile();
      homeController.getProfile();
      Get.back();
    } catch (error) {}
  }
}
