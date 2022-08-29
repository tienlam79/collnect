import 'package:flutter/material.dart';
import 'package:collnect/api/api.dart';
import 'package:get/get.dart';

class ActivationAccountController extends GetxController {
  final ApiRepository apiRepository;
  ActivationAccountController({required this.apiRepository});

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

  void onLogin() async {}
}
