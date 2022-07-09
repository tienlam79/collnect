import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/constants/common.dart';
import 'package:omny_locator/shared/widgets/widgets.dart';

class OutlinedGradientButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double height;
  final void Function()? onPressed;

  final bool disabled;

  const OutlinedGradientButton({
    Key? key,
    this.text = "",
    this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 60.0,
    this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = disabled
        ? LinearGradient(colors: <Color>[
            ColorConstants.disabledButtonBackgroundColor,
            ColorConstants.disabledButtonBackgroundColor,
          ])
        : (gradient ?? CommonConstants.primaryGradientColors);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          gradient: colors,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: text != ""
                ? GradientText(
                    text,
                    style: Theme.of(context).textTheme.button,
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
