import 'package:flutter/material.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/utils/formatter.dart';
import 'package:uuid/uuid.dart';

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
  RxBool isScanCode = false.obs;
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
      fullCardNumber.value = cardNumberController.text;
    });

    debounce(
      fullCardNumber,
      (_) {
        if (fullCardNumber.value.length > 0) {
          getProduct();
        } else {
          resetProduct();
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
    cardNumberController.dispose();
    prefixCardNumberController.dispose();
  }

  void onSelectAmount(double value) {
    amountController.text = Formatter.removeDecimalZeroFormat(value);
    selectedAmount.value = value;
  }

  void setCode(String cardValue) {
    fullCardNumber.value = cardValue;
    isScanCode.value = true;
  }

  void getProduct() async {
    try {
      final payload = new ProductRequest(
        filterCode: cardNumber.value,
        filterType: CardType.ACTIVATION,
      );
      final res = await apiRepository.getProduct(payload);
      product.value = res;
      if (isScanCode.value) {
        String cardCode = fullCardNumber.value.replaceAll(res.prefix, '');
        prefixCardNumberController.text = res.prefix;
        prefixCode.value = res.prefix;
        cardNumber.value = cardCode;
        cardNumberController.text = cardCode;
        Get.offAndToNamed(Routes.ACTIVATED_CARD + Routes.PRODUCT_FORM,
            arguments: this);
      }
    } catch (error) {
    } finally {
      isScanCode.value = false;
    }
  }

  void resetProduct() {
    selectedAmount.value = 0.0;
    amountController.text = '';
    product.value = new Product(
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
    );
  }

  void setManual() {
    isScanCode.value = false;
    prefixCardNumberController.text = '';
    cardNumberController.text = '';
    cardNumber.value = '';
    prefixCode.value = '';
    resetProduct();
    Get.toNamed(Routes.ACTIVATED_CARD + Routes.PRODUCT_FORM, arguments: this);
  }

  RxDouble get fee {
    if (product.value.priceType == PriceType.OPEN) {
      return product.value.feeList.length > 0
          ? product.value.feeList[0].obs
          : 0.0.obs;
    }
    int priceIndex = product.value.priceList
        .indexWhere((element) => selectedAmount.value == element);
    double fee = priceIndex > -1 && product.value.feeList.length > 0
        ? product.value.feeList[priceIndex]
        : 0.0;
    return fee.obs;
  }

  void onSubmit() async {
    try {
      var uuid = Uuid();
      var payload = new CreateOrderRequest(
        cid: uuid.v1(),
        productPin: cardNumberController.text,
        amount: selectedAmount.value.toString(),
        product: product.value.id,
        customerName: nameController.text,
        customerPhone: phoneText.value,
      );
      final res = await apiRepository.createOrder(payload);
      Get.until((route) => route.settings.name == '/home');
      Get.toNamed(Routes.RESULT, arguments: res);
    } catch (error) {}
  }
}
