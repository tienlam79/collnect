import 'package:flutter/material.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/app_pages.dart';

class LoginController extends GetxController {
  final ApiRepository apiRepository;
  LoginController({required this.apiRepository});

  final phoneController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');

  RxString phoneNumber = ''.obs;

  @override
  void onInit() {
    phoneController.addListener(() {
      phoneNumber.value = phoneController.text.replaceAll('-', '');
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    nameController.dispose();
  }

  void onLogin() async {
    try {
      var str = nameController.text.split(' ');
      String firstName = str[0];
      String lastName = nameController.text.replaceFirst(firstName, '');
      VerificationCodeRequest loginPayload = new VerificationCodeRequest(
        phone: phoneNumber.value,
        firstName: firstName,
        lastName: lastName,
      );
      var res = await apiRepository.sendVerificationCode(loginPayload);
      Get.toNamed(Routes.VERIFICATION,
          arguments: [phoneNumber.value, res.checkCode, firstName, lastName]);
    } catch (error) {}
  }
}
