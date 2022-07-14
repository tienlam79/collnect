import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/modules/nearby_store/nearby_store_controller.dart';
import 'package:share_plus/share_plus.dart';

class StoreDetailController extends GetxController {
  final ApiRepository apiRepository;
  StoreDetailController({required this.apiRepository});

  final NearbyStoreController nearbyStoreController = Get.find();

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
    Store params = Get.arguments;
    store.value = params;
    getStoreDetail();
  }

  void getStoreDetail() async {
    try {
      Store params = Get.arguments;
      var res = await apiRepository.getStoreById(params.id);
      store.value = res;
    } catch (error) {}
  }

  void onFavorite() async {
    try {
      var payload = new FavoriteStoreRequest(
        like: store.value.like == null || store.value.like == false
            ? true
            : false,
        user: store.value.user ?? 0,
        rating: null,
        comment: null,
      );
      await apiRepository.favoriteStore(payload);
      getStoreDetail();
      nearbyStoreController.getNearbyStores();
    } catch (error) {
    } finally {}
  }

  void onShareStore() {
    Share.share(
      'https://www.google.com/maps/search/?api=1&query=${store.value.latitude},${store.value.longitude}',
    );
  }
}
