import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:omny_locator/theme/theme_data.dart';

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
          image: AssetImage(ImageConstants.linearBg),
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
              SizedBox(
                height: 136,
              ),
              Image.asset(
                ImageConstants.homeSplash,
                width: 100,
                height: 100,
              ),
              SpacingMd(),
              Text(
                'omny_location'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SpacingXs(),
              Text(
                'reload_omny_card'.tr,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
