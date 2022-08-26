import 'package:collnect/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupBannner extends StatelessWidget {
  const SignupBannner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'get_started_free'.tr,
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
      ),
      height: 70,
      color: ColorConstants.primaryColor,
    );
  }
}
