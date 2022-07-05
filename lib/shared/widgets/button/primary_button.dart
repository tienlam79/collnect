import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final double size;
  final Function? onPressed;
  final bool disabled;
  final String variant;

  const PrimaryButton({
    Key? key,
    this.text = "",
    this.child,
    this.size = 60,
    this.onPressed,
    this.variant = 'success',
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // color: Theme.of(context)
            //     .elevatedButtonTheme
            //     .style
            //     !.backgroundColor
            //     ?.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // primary: disabled
          //     ? ColorConstants.disabledButtonBackgroundColor
          //     : ColorConstants.primaryButtonBackgroundColor,
          minimumSize: Size.fromHeight(size),
        ),
        onPressed: disabled ? () => {} : onPressed as void Function()?,
        child: text != ''
            ? Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              )
            : child,
      ),
    );
  }
}
