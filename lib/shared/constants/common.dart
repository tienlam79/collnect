import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/colors.dart';

class CommonConstants {
  static const double largeText = 40.0;
  static const double normalText = 22.0;
  static const double smallText = 16.0;
  static const double hPadding = 16.0;
  static const double vPadding = 24.0;
  static const double borderRadius = 8.0;
  static const double spacingSx = 8.0;
  static const double spacingSm = 16.0;
  static const double spacingMd = 24.0;
  static const double spacingLg = 32.0;
  static const double iconSize = 24.0;
  static const String USCountryCode = '1';
  static const double lineHeight = 1.2;
  static const double titleSpacing = -10.0;
  static const int pageSize = 20;
  static Gradient primaryGradientColors = LinearGradient(
    colors: <Color>[
      hexToColor('#326FCD'),
      hexToColor('#183FB9'),
    ],
  );
  static Gradient secondaryGradientColors = LinearGradient(
    colors: <Color>[
      hexToColor('#FFFFFF'),
      hexToColor('#FFFFFF'),
    ],
  );
}
