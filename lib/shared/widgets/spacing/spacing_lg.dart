import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/common.dart';

class SpacingLg extends StatelessWidget {
  const SpacingLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CommonConstants.spacingLg,
    );
  }
}
