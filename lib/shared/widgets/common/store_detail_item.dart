import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:omny_locator/models/store.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/widgets/widgets.dart';

class StoreDetailItem extends StatelessWidget {
  const StoreDetailItem({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStoreName(context),
        SpacingSm(),
        _buildRating(context),
        SpacingSm(),
        Text(
          '${store.street}${store.state != null ? ', ' : ''}${store.state}${store.suite != null && store.suite != '' ? ', ' : ''}${store.suite}${store.city != null ? ', ' : ''} ${store.city} ${store.zipCode}',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(),
        ),
        // _buildProductType(context)
      ],
    );
  }

  Widget _buildStoreName(BuildContext context) {
    return Row(
      children: [
        if (store.like == true)
          Icon(
            Icons.favorite,
            color: ColorConstants.lightOrange,
            size: 16,
          ),
        SizedBox(
          width: 8,
        ),
        RichText(
          text: TextSpan(
            text: store.storeName,
            style: Theme.of(context).textTheme.headline5,
            children: [
              TextSpan(
                text: ' ${store.radius} miles',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorConstants.lightLabelInputColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRating(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          unratedColor: Colors.black,
          itemSize: 16,
          rating: store.rating ?? 0.0,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: ColorConstants.lightOrange,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        if (store.reviewCount != null && store.reviewCount! > 0)
          Text(
            '${store.reviewCount}${store.reviewCount == 1 ? ' review' : ' reviews'}',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(),
          ),
      ],
    );
  }
}
