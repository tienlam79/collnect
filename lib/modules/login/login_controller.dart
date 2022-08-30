import 'package:collnect/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:collnect/api/api.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ApiRepository apiRepository;
  LoginController({required this.apiRepository});

  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  RxString phoneNumber = ''.obs;

  @override
  void onInit() {
    emailController.addListener(() {
      phoneNumber.value = emailController.text.replaceAll('-', '');
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
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() async {
    Get.offAllNamed(Routes.HOME);
  }
}
