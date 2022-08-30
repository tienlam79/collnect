import 'package:collnect/models/feature.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';

class HomeFeatures extends StatelessWidget {
  HomeFeatures({
    Key? key,
    required this.features,
  }) : super(key: key);
  final List<Feature> features;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: _buildItem,
      separatorBuilder: ((context, index) => SpacingXs()),
      itemCount: features.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final Feature item = features[index];
    return Container(
      height: 76,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: CommonConstants.hPadding,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: ColorConstants.thunderbird),
          ),
          Text(
            item.desc,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
