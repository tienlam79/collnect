import 'package:carousel_slider/carousel_slider.dart';
import 'package:collnect/models/promotion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePromotions extends StatelessWidget {
  const HomePromotions({
    Key? key,
    required this.promotions,
  }) : super(key: key);

  final List<Promotion> promotions;
  @override
  Widget build(BuildContext context) {
    double arrowRadius = 3.0;
    double arrowWidth = 14.0;
    double arrowHeight = 26.0;
    double itemHeight = 68.0;
    double top = (itemHeight - arrowHeight) / 2;

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: promotions.length,
          itemBuilder: _buildPromotionItem,
          options: CarouselOptions(
            height: itemHeight,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
          ),
        ),
        Positioned(
          top: top,
          left: 0,
          child: Container(
            alignment: Alignment.center,
            width: arrowWidth,
            height: arrowHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(arrowRadius),
                bottomRight: Radius.circular(arrowRadius),
              ),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Icon(
              Icons.chevron_left,
              size: arrowWidth,
            ),
          ),
        ),
        Positioned(
          top: top,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            width: arrowWidth,
            height: arrowHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(arrowRadius),
                bottomLeft: Radius.circular(arrowRadius),
              ),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Icon(
              Icons.chevron_right,
              size: arrowWidth,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromotionItem(
      BuildContext context, int itemIndex, int pageViewIndex) {
    final Promotion item = promotions[itemIndex];
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
