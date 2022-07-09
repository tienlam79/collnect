import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/constants/common.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonConstants.hPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: hexToColor('#99B2FE'),
        ),
        borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
        color: hexToColor('#E3EAFF'),
      ),
      child: child,
    );
  }
}
