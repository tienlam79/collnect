import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/api/api_repository.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/common.dart';

class PreOrderHistoryController extends GetxController {
  PreOrderHistoryController({
    required this.apiRepository,
  });

  final ApiRepository apiRepository;
  final ScrollController scrollController = ScrollController();

  RxList<Order> orders = <Order>[].obs;
  RxInt page = 1.obs;
  RxInt total = 0.obs;
  RxBool initLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPreOrderHistories();

    debounce(
      page,
      (value) {
        int itemCount = page.value * CommonConstants.pageSize;
        if (itemCount <= total.value) {
          getPreOrderHistories();
        }
      },
      time: Duration(seconds: 1),
    );

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        int nextPage = page.value + 1;
        page.value = nextPage;
      }
    });
  }

  void getPreOrderHistories() async {
    try {
      final res = await apiRepository.getPreOrders(
        page.value,
        CommonConstants.pageSize,
      );
      final list =
          res.results.map<Order>((entry) => Order.fromJson(entry)).toList();
      total.value = res.count;
      List<Order> newList = [
        ...orders,
        ...list,
      ];
      orders.assignAll(newList);
    } catch (error) {
      print('errorr..${error.toString()}');
    } finally {
      initLoading.value = false;
    }
  }
}
