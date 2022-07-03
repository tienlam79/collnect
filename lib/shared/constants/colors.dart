import 'package:flutter/material.dart';

class ColorConstants {
  static Color lightScaffoldBackgroundColor = hexToColor('#F0F0F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#18BA71');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color lightPrimaryTextColor = hexToColor('#000000');
  static Color lightSecodaryTextColor = hexToColor('#666666');
  static Color primaryColor = hexToColor('#183FB9');
  static Color labelInputColor = hexToColor('#666666');
  static Color borderInputColor = hexToColor('#E0E0E0');
  static Color focusedBorderInputColor = hexToColor('#183FB9');
  static Color secondaryBackgroundColor = hexToColor('#183FB9');
  static Color primaryButtonBackgroundColor = hexToColor('#FFC96E');
  static Color secondaryButtonBackgroundColor = hexToColor('#18BA71');
  static Color disabledButtonBackgroundColor = hexToColor('#C6C6C6');
  static Color iconColor = hexToColor('#333333');
  static Color alertIconColor = hexToColor('#999999');
  static Color cardBackgroundColor = hexToColor('#18BA71');
  static Color creditCardBackgroundColor = hexToColor('#2147BB');
  static Color divivedColor = hexToColor('#326FCD');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
