import 'package:flutter/material.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/app_pages.dart';

class LoginController extends GetxController {
  final ApiRepository apiRepository;
  LoginController({required this.apiRepository});

  final yourIdController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  RxString yourId = ''.obs;
  RxString password = ''.obs;

  @override
  void onInit() {
    yourIdController.addListener(() {
      yourId.value = yourIdController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
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
    yourIdController.dispose();
    passwordController.dispose();
  }

  void onForgotPassword() {}
  void onLogin() async {
    try {
      LoginRequest loginPayload =
          new LoginRequest(username: yourId.value, password: password.value);
      var res = await apiRepository.login(loginPayload);
      SendVerificationCodeRequest payload = new SendVerificationCodeRequest(
          username: yourId.value, checkCode: res.checkCode);
      await apiRepository.sendVerificationCode(payload);
      Get.toNamed(Routes.VERIFICATION,
          arguments: [yourId.value, res.checkCode]);
    } catch (error) {}
  }
}
