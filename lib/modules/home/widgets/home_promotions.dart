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
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 68,
            viewportFraction: 1.0,
          ),
          itemCount: promotions.length,
          itemBuilder: _buildPromotionItem,
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
