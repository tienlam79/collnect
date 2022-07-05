import 'package:flutter/material.dart';
import 'package:omny_business/shared/shared.dart';

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
    // Color? accentColor,
    // Color? divider,
    // required Color? buttonBackground,
    // required Color buttonText,
    // Color? cardBackground,
    // Color? disabled,
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
            fontSize: 18,
            height: 1.2,
            fontFamily: 'Lato',
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: iconColor),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        iconTheme: IconThemeData(
          color: iconColor,
          size: 24,
        ),
        titleTextStyle: TextStyle(
          color: appBarTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          height: 1.2,
          fontFamily: 'Lato',
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
            borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        isDense: true,
        suffixIconColor: secondaryText,
        focusColor: Colors.red,
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        errorStyle: TextStyle(color: errorColor),
        floatingLabelStyle: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 1.2,
          color: labelInputColor,
          letterSpacing: 0,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 1.2,
          color: labelInputColor,
          letterSpacing: 0,
        ),
        hintStyle: TextStyle(
          color: labelInputColor,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
          borderSide: BorderSide(
            color: borderInputColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
          borderSide: BorderSide(
            color: enabledBorderInputColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
          borderSide: BorderSide(
            color: enabledBorderInputColor,
            width: 2.0,
          ),
        ),
        prefixStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: labelInputColor,
        ),
      ),
      fontFamily: 'Lato',
      primaryTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Lato',
          ),
      textTheme: TextTheme(
        headline1: baseTextTheme.headline1!.copyWith(
          color: primaryText,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        headline2: baseTextTheme.headline2!.copyWith(
          color: primaryText,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        headline3: baseTextTheme.headline3!.copyWith(
          color: primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        headline4: baseTextTheme.headline4!.copyWith(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        headline5: baseTextTheme.headline5!.copyWith(
          color: primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        headline6: baseTextTheme.headline6!.copyWith(
          color: primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        bodyText1: baseTextTheme.bodyText1!.copyWith(
          color: primaryText,
          fontSize: 15,
          height: 1.2,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: baseTextTheme.bodyText2!.copyWith(
          color: primaryText,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        button: baseTextTheme.button!.copyWith(
          color: buttonText,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        caption: baseTextTheme.caption!.copyWith(
          color: primaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        overline: baseTextTheme.overline!.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        subtitle1: baseTextTheme.subtitle1!.copyWith(
          color: primaryText,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Lato',
          height: 1.2,
        ),
        subtitle2: baseTextTheme.subtitle2!.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'Lato',
          height: 1.2,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          height: 1.2,
          fontFamily: 'Lato',
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: primaryText,
          fontWeight: FontWeight.w400,
          height: 1.2,
          fontFamily: 'Lato',
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
        enabledBorderInputColor: ColorConstants.lightEnabledBorderInputColor,
        iconColor: ColorConstants.lightIconColor,
        appBarBackgroundColor: Colors.white,
        errorColor: Colors.red,
        primaryColor: ColorConstants.lightPrimaryColor,
        surface: ColorConstants.lightDisabledButtonBackgroundColor,
        appBarTextColor: ColorConstants.lightAppBarTextColor,
      );
  static ThemeData get blueTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.blueScaffoldBackgroundColor,
        primaryText: ColorConstants.bluePrimaryTextColor,
        secondaryText: ColorConstants.blueSecondaryTextColor,
        buttonBackground: ColorConstants.blueButtonBackgroundColor,
        buttonText: ColorConstants.blueButtonTextColor,
        labelInputColor: ColorConstants.blueLabelInputColor,
        borderInputColor: ColorConstants.blueBorderInputColor,
        primaryColor: ColorConstants.bluePrimaryColor,
        appBarBackgroundColor: ColorConstants.blueScaffoldBackgroundColor,
        iconColor: ColorConstants.iconColor,
        errorColor: Colors.red,
        enabledBorderInputColor: ColorConstants.blueBorderInputColor,
        surface: ColorConstants.lightDisabledButtonBackgroundColor,
        appBarTextColor: ColorConstants.bluePrimaryColor,
      );
}
