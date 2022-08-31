import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.athensGray.withOpacity(0.4),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                _buildDrawerButton(
                  context,
                  'add_contact'.tr.toUpperCase(),
                  () => {},
                ),
                SpacingXs(),
                _buildDrawerButton(
                  context,
                  'send_message'.tr.toUpperCase(),
                  () => {},
                ),
              ],
            ),
          ),
          // ListTile(
          //   title: const Text('Item 1'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: const Text('Item 2'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildDrawerButton(
      BuildContext context, String title, void Function()? onPressed) {
    return GradientButton(
      height: 50,
      boxShadow: [],
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
      gradient: LinearGradient(
        colors: <Color>[
          ColorConstants.froly,
          ColorConstants.yellowSea,
        ],
      ),
    );
  }
}
