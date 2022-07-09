import 'package:flutter/material.dart';
import 'package:omny_locator/models/store.dart';
import 'package:omny_locator/shared/constants/colors.dart';
import 'package:omny_locator/shared/constants/common.dart';

class NearbyStoreItem extends StatelessWidget {
  const NearbyStoreItem({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: hexToColor('#99B2FE')),
            borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
          ),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: store.storeName,
                  style: Theme.of(context).textTheme.headline5,
                  children: [
                    TextSpan(
                      text: 'bold',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ColorConstants.lightLabelInputColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
