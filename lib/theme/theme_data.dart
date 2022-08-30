import 'package:flutter/material.dart';
import 'package:collnect/shared/shared.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    required Color buttonBackground,
    required Color buttonText,
    required Color secondaryText,
    required Color errorColor,
    required Color labelInputColor,
    required Color borderInputColor,
    required Color enabledBorderInputColor,
    required Color iconColor,
    required Color primaryColor,
    required Color appBarBackgroundColor,
    required Color surface,
    required Color appBarTextColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      backgroundColor: background,
      primaryColor: primaryColor,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: buttonBackground, // This is a custom color variable
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: CommonConstants.lineHeight,
            fontFamily: CommonConstants.fontFamily,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: iconColor),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: iconColor,
          size: 24,
        ),
        titleTextStyle: TextStyle(
          color: appBarTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          height: CommonConstants.lineHeight,
          fontFamily: CommonConstants.fontFamily,
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColor,
        size: 24,
      ),
      errorColor: errorColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: buttonBackground,
        onPrimary: buttonBackground,
        secondary: secondaryText,
        onSecondary: secondaryText,
        onSurface: surface,
        surface: surface,
        background: background,
        onBackground: background,
        error: errorColor,
        onError: errorColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: buttonBackground,
          primary: buttonBackground,
          elevation: 0,
          padding:
              const EdgeInsets.symmetric(horizontal: CommonConstants.hPadding),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(CommonConstants.btnBorderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        suffixIconColor: secondaryText,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        errorStyle: TextStyle(color: errorColor),
        hintStyle: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w400,
          color: secondaryText,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            color: borderInputColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            color: enabledBorderInputColor,
            width: 1.0,
          ),
        ),
        prefixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: labelInputColor,
        ),
      ),
      fontFamily: CommonConstants.fontFamily,
      // primaryTextTheme: ThemeData.light().textTheme.apply(
      //       fontFamily: CommonConstants.fontFamily,
      //     ),
      textTheme: TextTheme(
        headline1: baseTextTheme.headline1!.copyWith(
          color: primaryText,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        headline2: baseTextTheme.headline2!.copyWith(
          color: primaryText,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        headline3: baseTextTheme.headline3!.copyWith(
          color: primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        headline4: baseTextTheme.headline4!.copyWith(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        headline5: baseTextTheme.headline5!.copyWith(
          color: primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        headline6: baseTextTheme.headline6!.copyWith(
          color: primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        bodyText1: baseTextTheme.bodyText1!.copyWith(
          color: primaryText,
          fontSize: 15,
          height: CommonConstants.lineHeight,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: baseTextTheme.bodyText2!.copyWith(
          color: primaryText,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        button: baseTextTheme.button!.copyWith(
          color: buttonText,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        caption: baseTextTheme.caption!.copyWith(
          color: primaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        overline: baseTextTheme.overline!.copyWith(
          color: secondaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        subtitle1: baseTextTheme.subtitle1!.copyWith(
          color: primaryText,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
        subtitle2: baseTextTheme.subtitle2!.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          fontFamily: CommonConstants.fontFamily,
          height: CommonConstants.lineHeight,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          height: CommonConstants.lineHeight,
          fontFamily: CommonConstants.fontFamily,
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: primaryText,
          fontWeight: FontWeight.w400,
          height: CommonConstants.lineHeight,
          fontFamily: CommonConstants.fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          // <-- Radius
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.dark,
        background: ColorConstants.lightScaffoldBackgroundColor,
        primaryText: ColorConstants.lightPrimaryTextColor,
        secondaryText: ColorConstants.lightSecodaryTextColor,
        buttonBackground: ColorConstants.lightButtonBackgroundColor,
        buttonText: ColorConstants.lightButtonTextColor,
        labelInputColor: ColorConstants.lightLabelInputColor,
        borderInputColor: ColorConstants.lightBorderInputColor,
        enabledBorderInputColor: ColorConstants.primaryColor,
        iconColor: ColorConstants.lightIconColor,
        appBarBackgroundColor: Colors.white,
        errorColor: Colors.red,
        primaryColor: ColorConstants.lightPrimaryColor,
        surface: ColorConstants.lightDisabledButtonBackgroundColor,
        appBarTextColor: ColorConstants.lightAppBarTextColor,
      );
  static ThemeData get purpleTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.blueScaffoldBackgroundColor,
        primaryText: ColorConstants.bluePrimaryTextColor,
        secondaryText: ColorConstants.blueSecondaryTextColor,
        buttonBackground: ColorConstants.blueButtonBackgroundColor,
        buttonText: ColorConstants.blueButtonTextColor,
        labelInputColor: ColorConstants.blueLabelInputColor,
        borderInputColor: ColorConstants.blueBorderInputColor,
        primaryColor: ColorConstants.bluePrimaryColor,
        appBarBackgroundColor: ColorConstants.blueAppBarBackgroundColor,
        iconColor: ColorConstants.blueIconColor,
        errorColor: Colors.red,
        enabledBorderInputColor: ColorConstants.blueBorderInputColor,
        surface: ColorConstants.lightDisabledButtonBackgroundColor,
        appBarTextColor: ColorConstants.bluePrimaryColor,
      );
}
