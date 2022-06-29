import 'package:flutter/material.dart';
import 'package:omny_business/shared/constants/colors.dart';
import 'package:omny_business/shared/constants/common.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final double size;
  final Function? onPressed;
  final bool disabled;
  final Color? color;

  const SecondaryButton({
    Key? key,
    this.text = "",
    this.child,
    this.size = 60,
    this.onPressed,
    this.color = Colors.red,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: disabled
            ? null
            : [
                BoxShadow(
                  color: ColorConstants.secondaryButtonBackgroundColor
                      .withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: disabled
              ? ColorConstants.disabledButtonBackgroundColor
              : ColorConstants.secondaryButtonBackgroundColor,
          minimumSize: Size.fromHeight(size),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                CommonConstants.borderRadius), // <-- Radius
          ),
        ),
        onPressed: disabled ? () => {} : onPressed as void Function()?,
        child: text != ''
            ? Text(
                text,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: disabled
                          ? ColorConstants.lightPrimaryTextColor
                          : Colors.white,
                    ),
              )
            : child,
      ),
    );
  }
}
