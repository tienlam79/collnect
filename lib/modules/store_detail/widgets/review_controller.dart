import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/api/api_repository.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/common.dart';

class ReviewController extends GetxController {
  ReviewController({
    required this.apiRepository,
    required this.store,
  });

  final Store store;

  final ApiRepository apiRepository;
  final ScrollController scrollController = ScrollController();

  RxList<Comment> reviews = <Comment>[].obs;
  RxInt page = 1.obs;
  RxInt total = 0.obs;
  RxBool initLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getStoreReviews();

    debounce(
      page,
      (value) {
        int itemCount = page.value * CommonConstants.pageSize;
        if (itemCount <= total.value) {
          getStoreReviews();
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

  void getStoreReviews() async {
    try {
      final res = await apiRepository.getStoreReviews(
          page.value, CommonConstants.pageSize, store.user);
      final list =
          res.results.map<Comment>((entry) => Comment.fromJson(entry)).toList();
      total.value = res.count;
      List<Comment> newList = [
        ...reviews,
        ...list,
      ];
      reviews.assignAll(newList);
    } catch (error) {
    } finally {
      initLoading.value = false;
    }
  }

  void onRefreshReviews(page) async {
    try {
      final res = await apiRepository.getStoreReviews(
          page, CommonConstants.pageSize, store.user);
      final list =
          res.results.map<Comment>((entry) => Comment.fromJson(entry)).toList();
      total.value = res.count;
      reviews.assignAll(list);
    } catch (error) {
    } finally {}
  }

  void onChangeRating(double rating) {}

  void setPage(int value) {
    page.value = value;
  }
}
