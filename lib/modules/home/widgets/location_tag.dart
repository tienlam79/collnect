import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/colors.dart';

class LocationTag extends StatelessWidget {
  const LocationTag({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);
  final String text;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: backgroundColor ?? ColorConstants.lightButtonBackgroundColor,
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: textColor ?? Colors.white),
      ),
    );
  }
}
