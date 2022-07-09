import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:omny_locator/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_constants.dart';

FutureOr<Request> requestInterceptor(request) async {
  var storage = Get.find<SharedPreferences>();
  String? token = storage.getString(StorageConstants.token);
  request.headers['Authorization'] = 'Bearer $token';
  request.headers['x-sku'] = ApiConstants.sku;

  EasyLoading.show(status: 'loading...');
  return request;
}
