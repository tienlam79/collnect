import 'package:omny_locator/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StoreDetailController extends GetxController {
  final ApiRepository apiRepository;
  StoreDetailController({required this.apiRepository});

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
      print('...store.. ${res.toJson()}');
    } catch (error) {}
  }

  void onFavorite() async {
    // store.value.like = store.value.like == true ? false : true;
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
    } catch (error) {
      print('error....');
    } finally {}
  }
}
