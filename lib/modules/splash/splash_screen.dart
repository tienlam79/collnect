import 'package:collnect/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collnect/shared/shared.dart';
import 'package:collnect/theme/theme_data.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeConfig.blueTheme,
      child: Builder(
        builder: (BuildContext c) => _buildContent(c),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.splashBg),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
        color: ColorConstants.primaryColor,
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(CommonConstants.hPadding),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.logo,
                      height: 70,
                    ),
                    SpacingMd(),
                    Text(
                      'logan'.tr,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: ColorConstants.primaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: GradientButton(
                    text: 'getting_started'.tr,
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
