import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/modules/home/widgets/nearby_store_list.dart';
import 'package:omny_locator/modules/pre_order_omny_card/pre_order_omny_card.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final PreOrderOmnyCardController preOrderController = Get.put(
    PreOrderOmnyCardController(
      apiRepository: Get.find(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      centerTitle: false,
      showBackIcon: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInstruction(context),
          SpacingMd(),
          _buildScanBarCodeButton(context),
          SpacingMd(),
          Obx(
            () => controller.positon.value.latitude != 0.0 &&
                    controller.positon.value.longitude != 0.0
                ? NearbyStoreList(
                    latitude: controller.positon.value.latitude,
                    longitude: controller.positon.value.longitude,
                  )
                : Container(),
          ),
          // enableLocationDialog(),
        ],
      ),
      title: Obx(
        () => Text(
          'welcome'.trParams({
            'name': controller.profile.value.firstName ?? '',
          }),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.PROFILE),
          icon: Icon(
            Icons.account_circle,
            size: 26,
            color: ColorConstants.primaryColor,
          ),
        )
      ],
    );
  }

  Widget _buildScanBarCodeButton(BuildContext context) {
    return PrimaryButton(
      onPressed: () => Get.toNamed(Routes.PRE_ORDER_OMNY_CARD,
          arguments: preOrderController),
      size: 120,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          ImageConstants.barCodeWhiteIcon,
          width: 32,
          height: 32,
        ),
        title: Text(
          'scan_code_pre_order'.tr,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 23,
                color: Colors.white,
              ),
        ),
      ),
    );
  }

  Widget _buildInstruction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(text: 'instruction'.tr),
        SpacingXs(),
        Text(
          'instruction_1'.tr,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.5),
        ),
        Text(
          'instruction_2'.tr,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.5),
        ),
      ],
    );
  }
}
