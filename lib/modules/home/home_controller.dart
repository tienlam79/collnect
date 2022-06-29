import 'package:omny_business/api/api.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/routes/routes.dart';
import 'package:omny_business/shared/constants/constants.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  RxString name = 'NYSTORE01'.obs;
  RxDouble creditBalance = 500.0.obs;
  final List<Feature> featureList = [
    new Feature(
      icon: ImageConstants.reloadIcon,
      title: 'reload'.tr,
      subTitle: 'OMNY card',
      route: Routes.RELOAD_CARD,
    ),
    new Feature(
      icon: ImageConstants.scanIcon,
      title: 'scan'.tr,
      subTitle: 'Pre-order',
      route: Routes.SCAN_PRE_ORDER,
    ),
    new Feature(
      icon: ImageConstants.activatedIcon,
      title: 'activated'.tr,
      subTitle: 'new OMNY card',
      route: Routes.ACTIVATED_CARD,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
