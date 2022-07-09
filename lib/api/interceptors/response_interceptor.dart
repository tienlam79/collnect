import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/shared.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();
  print('response.statusCode. ${response.statusCode}');
  if (response.statusCode != 200 && response.statusCode != 201) {
    handleErrorStatus(response);
    return throw Future.error('Api request error');
  }
  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final error = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(error.message ?? 'Something went wrong.');
      break;
    case 500:
      CommonWidget.toast(response.statusText ?? 'Something went wrong.');
      break;
    default:
      break;
  }
  return;
}
