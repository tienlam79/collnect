import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/constants/common.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double height;
  final Function? onPressed;
  final bool disabled;

  const GradientButton({
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: colors,
        borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
        boxShadow: disabled
            ? null
            : [
                BoxShadow(
                  color: ColorConstants.primaryColor,
                  offset: Offset(0.0, 1.5),
                  blurRadius: 1.5,
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed as void Function()?,
          child: Center(
            child: text != ""
                ? Text(
                    text,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: disabled ? Colors.black : Colors.white,
                        ),
                    // style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: CommonConstants.smallText,
                    //   fontWeight: FontWeight.w700,
                    // ),
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
