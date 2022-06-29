import 'package:flutter/material.dart';
import 'package:omny_business/shared/constants/colors.dart';
import 'package:omny_business/shared/constants/common.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    var colors = gradient ?? CommonConstants.primaryGradientColors;
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => colors.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
