import 'package:flutter/material.dart';
import 'package:omny_business/shared/shared.dart';

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
        color: ColorConstants.secondaryBackgroundColor,
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(CommonConstants.hPadding),
          child: child,
        ),
      ),
    );
  }
}
