import 'package:flutter/material.dart';
import 'package:omny_business/shared/constants/common.dart';

class GradientRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  GradientRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.width = 27,
    this.height = 27,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(this.value);
      },
      child: value == groupValue
          ? Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    gradient: CommonConstants.primaryGradientColors,
                  ),
                ),
                Container(
                  height: height - 5,
                  width: width - 5,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    gradient: CommonConstants.secondaryGradientColors,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    gradient: CommonConstants.primaryGradientColors,
                  ),
                ),
              ],
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(width / 2),
              ),
            ),
    );
  }
}
