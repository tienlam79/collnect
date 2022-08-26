import 'package:flutter/material.dart';
import 'package:collnect/api/api.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final ApiRepository apiRepository;
  SignupController({required this.apiRepository});

  final phoneController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final referralCodeController = TextEditingController(text: '');

  RxBool isSuccess = false.obs;
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
  }

  void onSignIn() async {
    isSuccess.value = true;
  }
}
