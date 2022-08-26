import 'package:flutter/material.dart';
import 'package:collnect/shared/constants/common.dart';

class SpacingMd extends StatelessWidget {
  const SpacingMd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CommonConstants.spacingMd,
    );
  }
}
