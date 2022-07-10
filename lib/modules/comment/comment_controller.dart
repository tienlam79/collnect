import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:omny_locator/modules/store_detail/store_detail.dart';
import 'package:omny_locator/modules/store_detail/widgets/review_controller.dart';
import 'package:omny_locator/shared/constants/storage.dart';
import 'package:omny_locator/shared/utils/common_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentController extends GetxController {
  final ApiRepository apiRepository;
  CommentController({required this.apiRepository});

  final commentController = TextEditingController(text: '');
  final ReviewController reviewController = Get.find();
  final StoreDetailController storeDetailController = Get.find();

  RxDouble rating = 0.0.obs;
  RxString comment = ''.obs;
  RxList<XFile> imageFiles = <XFile>[].obs;
  Rx<Store> store = new Store(
    id: 0,
    storeName: '',
    street: '',
    latitude: 0.0,
    longitude: 0.0,
  ).obs;

  @override
  void onInit() {
    super.onInit();

    var params = Get.arguments;
    store.value = params;

    commentController.addListener(() {
      comment.value = commentController.text;
    });
  }

  void onChangeRating(double value) {
    rating.value = value;
  }

  void onSubmit() async {
    EasyLoading.show(status: 'loading...');
    try {
      var storage = Get.find<SharedPreferences>();
      String? token = storage.getString(StorageConstants.token);
      var uri = Uri.parse(
          '${ApiConstants.baseUrl}/customer-api/customer/retailer-reviews');
      http.MultipartRequest request = new http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['x-sku'] = '${ApiConstants.sku}';
      request.fields['user'] = '${store.value.user}';
      request.fields['like'] = store.value.like == true ? '1' : '0';
      request.fields['rating'] = '${rating.value}';
      request.fields['comment'] = '${comment.value}';
      List<http.MultipartFile> newList = [];
      for (var i = 0; i < imageFiles.length; i++) {
        var multipartFile = await http.MultipartFile.fromPath(
          'image_$i',
          imageFiles[i].path,
        );
        newList.add(multipartFile);
      }
      request.files.addAll(newList);

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        reviewController.onRefreshReviews(1);
        storeDetailController.getStoreDetail();
        Get.back();
      }
    } catch (error) {
      CommonWidget.toast('Something went wrong. Please try agan.');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFiles.add(pickedFile);
    }
  }

  void onRemoveImage(int imageIndex) {
    imageFiles.removeAt(imageIndex);
  }
}
