import 'package:flutter/material.dart';
import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/shared/utils/formatter.dart';

class ReloadCardController extends GetxController {
  final ApiRepository apiRepository;
  ReloadCardController({required this.apiRepository});

  final phoneController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final amountController = TextEditingController(text: '');
  final cardNumberController = TextEditingController(text: '');
  final prefixCardNumberController = TextEditingController(text: '');

  final phoneText = ''.obs;
  final nameText = ''.obs;
  RxBool isShowScanBarCodeForm = false.obs;
  RxDouble selectedAmount = 0.0.obs;
  RxString prefixCode = ''.obs;
  RxString code = ''.obs;
  Rx<Product> product = new Product(
    id: 0,
    name: '',
    sku: '',
    priceType: PriceType.OPEN,
    priceList: [],
    minPrice: 0,
    maxPrice: 100.0,
    suggestPriceList: [10.0, 15.0, 20.0, 25.0, 30.0],
    destAmountList: [100.0, 150.0, 200.0, 250.0, 300.0],
  ).obs;
  @override
  void onInit() {
    super.onInit();

    phoneController.addListener(() {
      phoneText.value = phoneController.text.replaceAll('-', '');
    });

    nameController.addListener(() {
      nameText.value = nameController.text;
    });

    amountController.addListener(() {
      selectedAmount.value = amountController.text != ''
          ? double.parse(amountController.text)
          : 0.0;
    });
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
    amountController.dispose();
  }

  void onNext() {
    isShowScanBarCodeForm.value = true;
    setCode();
  }

  void onSelectAmount(double value) {
    print('...valyes..$value');
    amountController.text = Formatter.removeDecimalZeroFormat(value);
    selectedAmount.value = value;
  }

  void setCode() {
    String cardNumber = '6375003176485918';
    String prefix = '79936689999000';

    cardNumberController.text = cardNumber;
    prefixCardNumberController.text = prefix;

    prefixCode.value = prefix;
    code.value = cardNumber;
  }
}
