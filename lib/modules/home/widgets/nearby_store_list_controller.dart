import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/api/api_repository.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/common.dart';

class NearbyStoreListController extends GetxController {
  NearbyStoreListController({
    required this.apiRepository,
  });

  final ApiRepository apiRepository;
  final ScrollController scrollController = ScrollController();

  RxList<Store> stores = <Store>[].obs;
  RxInt page = 1.obs;
  RxInt total = 0.obs;
  RxBool initLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNearbyStores();

    debounce(
      page,
      (value) {
        int itemCount = page.value * CommonConstants.pageSize;
        if (itemCount <= total.value) {
          getNearbyStores();
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

  void getNearbyStores() async {
    try {
      final res = await apiRepository.getNearbyStores(
          page.value, CommonConstants.pageSize);
      final list =
          res.results.map<Store>((entry) => Store.fromJson(entry)).toList();
      total.value = res.count;
      List<Store> newList = [
        ...stores,
        ...list,
      ];
      stores.assignAll(newList);
    } catch (error) {
    } finally {
      initLoading.value = false;
    }
  }
}
