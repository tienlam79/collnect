import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final double size;
  final void Function()? onPressed;
  final bool disabled;
  final String variant;

  const PrimaryButton({
    Key? key,
    this.text = "",
    this.child,
    this.size = 50,
    this.onPressed,
    this.variant = 'success',
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
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: disabled
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.primary,
          minimumSize: Size.fromHeight(size),
        ),
        onPressed: disabled ? () => {} : onPressed,
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
