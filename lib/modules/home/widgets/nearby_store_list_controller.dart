import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/api/api_repository.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/common.dart';

class NearbyStoreListController extends GetxController {
  NearbyStoreListController({
    required this.apiRepository,
    required this.longitude,
    required this.latitude,
  });

  final double longitude;
  final double latitude;
  final ApiRepository apiRepository;
  final ScrollController scrollController = ScrollController();

  RxList<Store> stores = <Store>[].obs;
  RxInt page = 1.obs;
  RxInt total = 0.obs;
  RxBool initLoading = true.obs;

  List<DropdownMenuItem<String>> sortByOptions = [
    new DropdownMenuItem(child: Text('sort_by_distant'.tr), value: 'distant'),
    new DropdownMenuItem(child: Text('sort_by_rating'.tr), value: 'rating'),
  ];

  RxString sortByOption = 'distant'.obs;
  RxBool addMore = false.obs;

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
    debounce(
      sortByOption,
      (value) {
        if (page.value == 1) {
          getNearbyStores();
        }
      },
      time: Duration(seconds: 1),
    );

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        addMore.value = true;
        int nextPage = page.value + 1;
        page.value = nextPage;
      }
    });
  }

  void getNearbyStores() async {
    try {
      final res = await apiRepository.getNearbyStores(
        page.value,
        CommonConstants.pageSize,
        latitude,
        longitude,
        sortByOption.value,
      );
      final list =
          res.results.map<Store>((entry) => Store.fromJson(entry)).toList();
      total.value = res.count;
      List<Store> newList = addMore.value
          ? [
              ...stores,
              ...list,
            ]
          : [...list];
      stores.assignAll(newList);
    } catch (error) {
    } finally {
      addMore.value = false;
      initLoading.value = false;
    }
  }

  void onChangeSort(String? sortBy) {
    if (sortBy != null) {
      sortByOption.value = sortBy;
      if (page.value != 1) {
        page.value = 1;
      }
    }
  }
}
