import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/nearby_store/nearby_store.dart';
import 'package:omny_locator/modules/nearby_store/nearby_store_list.dart';

class NearbyStoreListView extends StatelessWidget {
  NearbyStoreListView({Key? key}) : super(key: key);

  final NearbyStoreController controller =
      Get.put(new NearbyStoreController(apiRepository: Get.find()));
  @override
  Widget build(BuildContext context) {
    return NearbyStoreList(
      stores: controller.stores,
      scrollController: controller.scrollController,
      sortByOption: controller.sortByOption.value,
      sortByOptions: controller.sortByOptions,
      onChangeSort: controller.onChangeSort,
    );
  }
}
