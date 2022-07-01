import 'package:flutter/material.dart';
import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/request/register_request.dart';
import 'package:omny_business/routes/app_pages.dart';
import 'package:omny_business/shared/utils/regex.dart';

class RegisterController extends GetxController {
  final ApiRepository apiRepository;
  RegisterController({required this.apiRepository});

  final phoneController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');

  RxInt step = 1.obs;
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;

  @override
  void onInit() {
    firstNameController.addListener(() {
      firstName.value = firstNameController.text;
    });
    lastNameController.addListener(() {
      lastName.value = lastNameController.text;
    });
    emailController.addListener(() {
      email.value = emailController.text;
    });
    phoneController.addListener(() {
      phone.value = phoneController.text.replaceAll('-', '');
    });
    usernameController.addListener(() {
      username.value = usernameController.text;
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
    usernameController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  void onForgotPassword() {}
  void onRegister() async {
    try {
      RegisterRequest payload = new RegisterRequest(
        email: email.value,
        password: password.value,
        username: username.value,
        phone: phone.value,
        firstName: firstName.value,
        lastName: lastName.value,
      );
      await apiRepository.register(payload);
      Get.until((route) => route.settings.name == Routes.LOGIN);
    } catch (error) {}
  }

  void onLogin() {
    Get.toNamed(Routes.VERIFICATION);
  }

  void onNext() {
    step.value = step.value + 1;
  }

  void onBack() {
    step.value = step.value - 1;
  }

  RxBool get disabledButtonNext {
    switch (step.value) {
      case 1:
        return (firstName.value == '' || lastName.value == '').obs;
      case 2:
        return (email.value == '' ||
                (email.value != '' && !Regex.isEmail(email.value)))
            .obs;
      case 3:
        return (phone.value == '' ||
                (phone.value != '' && phone.value.length < 10))
            .obs;
      case 4:
        return (username.value == '' ||
                password.value == '' ||
                (password.value != '' && password.value.length < 1))
            .obs;
      default:
        return false.obs;
    }
  }
}
