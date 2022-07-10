import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:omny_locator/models/models.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/constants/common.dart';
import 'package:omny_locator/shared/widgets/widgets.dart';

class ReviewItem extends StatelessWidget {
  ReviewItem({
    Key? key,
    required this.review,
    required this.onRatingReview,
  }) : super(key: key);
  final Comment review;
  final Function(double rating) onRatingReview;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.hPadding),
            child:
                Text('John Wick', style: Theme.of(context).textTheme.headline5),
          ),
          SpacingXs(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.hPadding),
            child: RatingBarIndicator(
              unratedColor: Colors.black,
              itemSize: 20,
              rating: review.rating ?? 0.0,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
          SpacingSm(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonConstants.hPadding),
            child: Text(
              review.comment ?? '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          if (review.images!.length > 0) _buildPreviewImages(context)
        ],
      ),
    );
  }

  Widget _buildPreviewImages(BuildContext context) {
    return Container(
      height: 108,
      padding: const EdgeInsets.fromLTRB(
          CommonConstants.hPadding, CommonConstants.hPadding, 0, 0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildPreviewImageItem,
        itemCount: review.images!.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 8,
        ),
      ),
    );
  }

  Widget _buildPreviewImageItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      width: 108,
      height: 108,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          review.images![index].image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
