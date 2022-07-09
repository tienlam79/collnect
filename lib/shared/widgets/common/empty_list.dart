import 'package:flutter/material.dart';
import 'package:omny_locator/shared/shared.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
    required this.image,
    required this.title,
    this.desc,
  }) : super(key: key);

  final String image;
  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SpacingMd(),
          Image.asset(
            image,
            height: 110,
          ),
          SpacingSm(),
          Text(title, style: Theme.of(context).textTheme.headline5),
          SpacingXs(),
          if (desc != null)
            Text(
              desc ?? '',
              style: Theme.of(context).textTheme.overline!.copyWith(
                  // color: ColorConstants.overlineColor,
                  ),
            ),
        ],
      ),
    );
  }
}
