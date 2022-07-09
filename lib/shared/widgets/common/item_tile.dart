import 'package:flutter/material.dart';
import 'package:omny_locator/shared/shared.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  }) : super(key: key);

  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          title,
          style: titleStyle ??
              Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.lightLabelInputColor),
        ),
      ),
      subtitle: Text(value,
          style: valueStyle ?? Theme.of(context).textTheme.headline4),
    );
  }
}
