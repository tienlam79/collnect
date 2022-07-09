import 'package:flutter/material.dart';
import 'package:omny_locator/shared/shared.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
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
          // color: ColorConstants.blueScaffoldBackgroundColor,
          padding: const EdgeInsets.all(CommonConstants.hPadding),
          child: child,
        ),
      ),
    );
  }
}
