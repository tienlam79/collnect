import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/shared/shared.dart';

class EnterPhoneNumber extends StatelessWidget {
  EnterPhoneNumber({
    Key? key,
    required this.phoneController,
    required this.nameController,
    required this.phoneText,
    required this.onNext,
  }) : super(key: key);

  final TextEditingController phoneController;
  final TextEditingController nameController;
  final RxString phoneText;
  final Function onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneField(
          autofocus: true,
          controller: phoneController,
          labelText: 'customer_phone_number'.tr,
        ),
        InputField(
          controller: nameController,
          labelText: 'name_optional'.tr,
        ),
        SpacingSm(),
        Obx(
          () => GradientButton(
            text: 'next'.tr,
            disabled: phoneText.value.length < 10,
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}
