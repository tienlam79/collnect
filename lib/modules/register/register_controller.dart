import 'package:flutter/material.dart';
import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/routes/app_pages.dart';

class RegisterController extends GetxController {
  final ApiRepository apiRepository;
  RegisterController({required this.apiRepository});

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
  void onRegister() {}
  void onLogin() {
    Get.toNamed(Routes.VERIFICATION);
  }
}
