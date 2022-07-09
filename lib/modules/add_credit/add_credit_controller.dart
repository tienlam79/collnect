import 'package:flutter/material.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/modules/home/home.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:uuid/uuid.dart';

class AddCreditController extends GetxController {
  final ApiRepository apiRepository;
  AddCreditController({required this.apiRepository});

  HomeController homeController = Get.find();

  final amountController = TextEditingController(text: '');
  RxDouble amount = 0.0.obs;
  RxList<AchOption> options = <AchOption>[].obs;
  Rx<AchOption> selectedOption = new AchOption(
    name: '',
    minAmount: 0.0,
    maxAmount: 0.0,
    fee: 0.0,
    type: '',
    order: 0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getAchOptions();

    amountController.addListener(() {
      amount.value = amountController.text != ''
          ? double.parse(amountController.text)
          : 0.0;
    });
  }

  void getAchOptions() async {
    try {
      var res = await apiRepository.getAchOptions();
      options.assignAll(res);
      // print('...res....${res.toList()}');
    } catch (error) {
      print('erro..${error.toString()}');
    }
  }

  void onSubmit() async {
    try {
      var uuid = Uuid();
      var payload = new CreateAchRequest(
        cid: uuid.v1(),
        amount: amountController.text,
        type: selectedOption.value.type,
      );
      var res = await apiRepository.createACH(payload);
      Get.offNamed(Routes.ADD_CREDIT_RESULT, arguments: res);
    } catch (error) {}
  }

  void onSelectOption(AchOption option) {
    selectedOption.value = option;
  }
}
