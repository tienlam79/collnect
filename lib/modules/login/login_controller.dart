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
      print('.....123');
      VerificationCodeRequest loginPayload =
          new VerificationCodeRequest(phone: phoneNumber.value);
      var res = await apiRepository.sendVerificationCode(loginPayload);
      Get.toNamed(Routes.VERIFICATION,
          arguments: [phoneNumber.value, res.checkCode, nameController.text]);
    } catch (error) {}
  }
}
