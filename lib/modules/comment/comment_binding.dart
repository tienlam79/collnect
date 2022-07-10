import 'package:get/get.dart';

import 'comment_controller.dart';

class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(
        () => CommentController(apiRepository: Get.find()));
  }
}
