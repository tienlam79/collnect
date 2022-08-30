import 'package:collnect/shared/constants/colors.dart';
import 'package:collnect/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildItem(context, 'unread'.tr, 10),
          Container(
            width: 1,
            color: ColorConstants.alto,
            height: 40,
          ),
          _buildItem(context, 'contacts'.tr, 1000),
          Container(
            width: 1,
            height: 40,
            color: ColorConstants.alto,
          ),
          _buildItem(context, 'opt_out'.tr, 2780),
          Container(
            width: 1,
            color: ColorConstants.alto,
            height: 40,
          ),
          _buildItem(context, 'opt_in'.tr, 250),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String label, double value) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '\$${Formatter.formatLocaleMoney(value)}',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w900),
          ),
          Text(label, style: Theme.of(context).textTheme.overline),
        ],
      ),
    );
  }
}
