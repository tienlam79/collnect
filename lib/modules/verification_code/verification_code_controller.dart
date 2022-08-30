import 'package:collnect/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:collnect/api/api.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  final ApiRepository apiRepository;
  VerificationCodeController({required this.apiRepository});

  final codeController = TextEditingController(text: '');
  RxString code = ''.obs;
  RxString phoneNumber = ''.obs;
  RxBool isStartTimer = true.obs;

  @override
  void onInit() {
    final params = Get.arguments;
    phoneNumber.value = params[0];

    codeController.addListener(() {
      code.value = codeController.text.replaceAll('-', '');
    });

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    codeController.dispose();
  }

  void onEndTimer() {
    isStartTimer.value = false;
  }

  void onVerify() {
    Get.toNamed(Routes.LOGIN);
  }
}
