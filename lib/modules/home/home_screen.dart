import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/models/models.dart';
import 'package:omny_business/routes/routes.dart';
import 'package:omny_business/shared/shared.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      child: Column(
        children: [
          _buildCreditBalance(context),
          SizedBox(
            height: 24,
          ),
          _buildFeature(context),
        ],
      ),
      title: Obx(
        () => Text(
          'welcome'.trParams({
            'name': controller.profile.value.username ?? '',
          }),
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: controller.onLogout,
          child: Text(
            'logout'.tr,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
          ),
        )
      ],
      centerTitle: false,
      showBackIcon: false,
      backgroundColor: ColorConstants.primaryColor,
      appBarBackgroundColor: ColorConstants.primaryColor,
      elevation: 0,
    );
  }

  Widget _buildCreditBalance(BuildContext context) {
    return Card(
      color: ColorConstants.lightButtonBackgroundColor,
      elevation: 0,
      child: ListTile(
        title: Text(
          'credit_balance'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        ),
        subtitle: Obx(
          () => Text(
            '\$${Formatter.formatLocaleMoney(controller.profile.value.balance)}',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        trailing: SizedBox(
          width: 136,
          height: 40,
          child: PrimaryButton(
            text: 'add_credit'.tr,
            onPressed: () => Get.toNamed(Routes.ADD_CREDIT),
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Feature item = controller.featureList[index];
    return Card(
      semanticContainer: true,
      child: ListTile(
        onTap: () => Get.toNamed(item.route),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 14, horizontal: CommonConstants.hPadding),
        leading: Image.asset(
          item.icon,
          width: 48,
          height: 48,
        ),
        title: Text(
          item.title.toUpperCase(),
          style: Theme.of(context).textTheme.headline2!.copyWith(
                // color: ColorConstants.white,
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
        ),
        subtitle: Text(
          item.subTitle,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                // color: ColorConstants.white,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return ListView.separated(
      itemBuilder: _buildItem,
      itemCount: controller.featureList.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => SpacingSm(),
    );
  }
}
