import 'package:collnect/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:collnect/api/api.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final ApiRepository apiRepository;
  SignupController({required this.apiRepository});

  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final referralCodeController = TextEditingController(text: '');

  RxString phoneNumber = ''.obs;

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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    referralCodeController.dispose();
  }

  void onSignIn() async {
    Get.toNamed(Routes.SIGNUP_SUCCESS);
  }
}
