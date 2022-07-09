import 'package:flutter/material.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/routes/routes.dart';
import 'package:omny_locator/shared/utils/formatter.dart';
import 'package:uuid/uuid.dart';

class PreOrderOmnyCardController extends GetxController {
  final ApiRepository apiRepository;
  PreOrderOmnyCardController({required this.apiRepository});

  final amountController = TextEditingController(text: '');
  final cardNumberController = TextEditingController(text: '');

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
      Get.offAndToNamed(Routes.PRE_ORDER_OMNY_CARD);
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
      );
      final res = await apiRepository.createPreOrder(payload);
      print('....rest....${res.toJson()}');
      Get.until((route) => route.settings.name == '/home');
      Get.toNamed(Routes.RESULT, arguments: res);
    } catch (error) {}
  }
}
