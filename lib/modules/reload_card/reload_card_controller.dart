import 'package:flutter/material.dart';
import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/routes/routes.dart';
import 'package:omny_business/shared/utils/formatter.dart';
import 'package:uuid/uuid.dart';

class ReloadCardController extends GetxController {
  final ApiRepository apiRepository;
  ReloadCardController({required this.apiRepository});

  final phoneController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final amountController = TextEditingController(text: '');
  final cardNumberController = TextEditingController(text: '');

  RxString phoneText = ''.obs;
  RxString nameText = ''.obs;
  RxDouble selectedAmount = 0.0.obs;
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
  void onClose() {
    super.onClose();
    phoneController.dispose();
    nameController.dispose();
    amountController.dispose();
    cardNumberController.dispose();
  }

  void onSelectAmount(double value) {
    amountController.text = Formatter.removeDecimalZeroFormat(value);
    selectedAmount.value = value;
  }

  void setCode(String cardValue) {
    fullCardNumber.value = cardValue;
  }

  void getProduct() async {
    try {
      final payload = new ProductRequest(
        filterCode: cardNumber.value,
        filterType: CardType.RELOAD,
      );
      final res = await apiRepository.getProduct(payload);
      product.value = res;
      String cardCode = fullCardNumber.value.replaceAll(res.prefix, '');
      cardNumber.value = cardCode;
      cardNumberController.text = cardCode;
      Get.offAndToNamed(Routes.RELOAD_CARD + Routes.PRODUCT_FORM,
          arguments: this);
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
