import 'package:collnect/models/menu.dart';
import 'package:collnect/routes/app_pages.dart';
import 'package:collnect/shared/constants/images.dart';
import 'package:get/get.dart';

class Menus {
  static List<Menu> dashboardMenus = [
    new Menu(
      title: 'dashboard'.tr,
      route: Routes.HOME,
      icon: ImageConstants.dashboardIcon,
    ),
    new Menu(
      title: 'chat_inbox'.tr,
      route: Routes.CHAT_INBOX,
      icon: ImageConstants.chatInboxIcon,
    ),
    new Menu(
      title: 'collnect_contact'.tr,
      icon: ImageConstants.contactIcon,
      options: [
        new Option(
          title: 'add_contacts'.tr,
          route: Routes.ADD_CONTACTS,
        ),
        new Option(
          title: 'qr_code'.tr,
          route: Routes.QRCODE,
        ),
        new Option(
          title: 'keywords'.tr,
          route: Routes.KEYWORDS,
        )
      ],
    ),
    new Menu(
      title: 'contact'.tr,
      icon: ImageConstants.messageIcon,
      options: [
        new Option(
          title: 'contact_list'.tr,
          route: Routes.CONTACT_LIST,
        ),
        new Option(
          title: 'contact_imported'.tr,
          route: Routes.CONTACT_IMPORTED,
        ),
        new Option(
          title: 'contact_groups'.tr,
          route: Routes.CONTACT_GROUPS,
        ),
      ],
    ),
    new Menu(
      title: 'message'.tr,
      icon: ImageConstants.contactIcon,
      options: [
        new Option(
          title: 'shedule_messages'.tr,
          route: Routes.SHEDULE_MESSAGES,
        ),
        new Option(
          title: 'sent_messages'.tr,
          route: Routes.SENT_MESSAGES,
        ),
      ],
    ),
    new Menu(
      title: 'report'.tr,
      route: Routes.REPORT,
      icon: ImageConstants.contactIcon,
    ),
    new Menu(
      title: 'service_ohter'.tr,
      icon: ImageConstants.serviceIcon,
      options: [
        new Option(
          title: 'links'.tr,
          route: Routes.SERVICE_LINKS,
        ),
        new Option(
          title: 'compliant_features'.tr,
          route: Routes.COMPLIANT_FEATURES,
        ),
        new Option(
          title: 'qa'.tr,
          route: Routes.SERVICE_QA,
        ),
      ],
    ),
  ];
}
