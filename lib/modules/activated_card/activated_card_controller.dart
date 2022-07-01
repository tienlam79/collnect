import 'package:flutter/material.dart';
import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/shared/utils/formatter.dart';

class ActivatedCardController extends GetxController {
  final ApiRepository apiRepository;
  ActivatedCardController({required this.apiRepository});

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
  RxString cardNumber = ''.obs;
  RxString fullCardNumber = ''.obs;
  Rx<Product> product = new Product(
    id: 0,
    name: '',
    prefix: '',
    sku: '',
    productFilter: '',
    minPrice: 0.0,
    maxPrice: 0.0,
    priceType: PriceType.OPEN,
    priceList: [],
    suggestPriceList: [],
    feeList: [],
  ).obs;

  RxBool isManual = false.obs;

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

    cardNumberController.addListener(() {
      if (isManual.value == true) {
        fullCardNumber.value = cardNumberController.text;
      }
    });

    debounce(
      fullCardNumber,
      (_) {
        if (fullCardNumber.value.length >= 1) {
          getProduct();
        }
      },
      time: Duration(seconds: 1),
    );
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
  }

  void onSelectAmount(double value) {
    amountController.text = Formatter.removeDecimalZeroFormat(value);
    selectedAmount.value = value;
  }

  void setCode(String cardValue) {
    // String cardNumber = '6375003176485918';
    // String prefix = '79936689999000';

    // cardNumberController.text = cardNumber;
    // prefixCardNumberController.text = prefix;

    // prefixCode.value = '';
    // code.value = cardValue;
    fullCardNumber.value = cardValue;
  }

  void getProduct() async {
    try {
      final payload = new ProductRequest(
        filterCode: cardNumber.value,
        filterType: CardType.ACTIVATION,
      );
      final res = await apiRepository.getProduct(payload);
      product.value = res;
      String cardCode = fullCardNumber.value.replaceAll(res.prefix, '');
      cardNumber.value = cardCode;
      cardNumberController.text = cardCode;
      prefixCardNumberController.text = res.prefix;
      prefixCode.value = res.prefix;
      print('...product...${res.toJson()}');
    } catch (error) {
      print('...getProduct errro...${error.toString()}');
    }
  }

  void setManual() {
    isManual.value = true;
  }
}
