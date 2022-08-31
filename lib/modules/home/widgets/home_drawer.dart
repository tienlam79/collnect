import 'package:collnect/models/models.dart';
import 'package:collnect/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.athensGray,
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
          ..._buildMenus(context),
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

  List _buildMenus(BuildContext context) {
    List<Widget> listWidget = [];
    List<Menu> listMenu = Menus.dashboardMenus;
    for (int index = 0; index < listMenu.length; index++) {
      final itemMenu = listMenu[index];
      Widget listTile = ListTile(
        leading: SvgPicture.asset(
          itemMenu.icon,
          semanticsLabel: 'Acme Logo',
        ),
        visualDensity: VisualDensity(vertical: -2),
        minLeadingWidth: 0,
        title: Text(
          itemMenu.title.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: ColorConstants.primaryColor),
        ),
      );
      listWidget.add(
        Container(
          decoration: BoxDecoration(
              // color: Colors.yellow,
              // border: Border.all(
              //   color: Colors.red,
              // ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listTile,
              if (itemMenu.options != null)
                ..._buildMenuOptions(context, itemMenu.options ?? []),
            ],
          ),
        ),
      );
    }
    return listWidget;
  }

  List<Widget> _buildMenuOptions(BuildContext context, List<Option> options) {
    List<Widget> optionWidgets = [];

    for (int index = 0; index < options.length; index++) {
      final itemOption = options[index];
      optionWidgets.add(
        ListTile(
          contentPadding: EdgeInsets.only(left: 50),
          visualDensity: VisualDensity(vertical: -4),
          title: Text(
            itemOption.title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primaryColor,
                ),
          ),
        ),
      );
    }
    return optionWidgets;
  }
}
