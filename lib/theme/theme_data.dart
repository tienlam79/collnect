import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omny_business/shared/shared.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
    required Color labelInputColor,
    required Color borderInputColor,
    required Color iconColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
        ),
        // shape: ShapeBorder()
      ),
      backgroundColor: background,
      primaryColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: ColorConstants
              .secondaryBackgroundColor, // This is a custom color variable
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            height: 1.2,
            fontFamily: 'Lato',
          ),
        ),
      ),
      toggleableActiveColor: accentColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: iconColor,
          size: 24,
        ),
        titleTextStyle: TextStyle(
          color: primaryText,
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
      errorColor: error,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          secondary: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        isDense: true,
        suffixIconColor: secondaryText,
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        errorStyle: TextStyle(color: error),
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
        border: InputBorder.none,
        prefixStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: labelInputColor,
        ),
        // style: TextStyle(background: )
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
      fontFamily: 'Lato',
      unselectedWidgetColor: hexToColor('#DADCDD'),
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
          color: secondaryText,
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
          color: primaryText,
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
        brightness: Brightness.light,
        background: ColorConstants.lightScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryAppColor,
        primaryText: ColorConstants.lightPrimaryTextColor,
        secondaryText: ColorConstants.lightSecodaryTextColor,
        accentColor: ColorConstants.secondaryAppColor,
        divider: ColorConstants.divivedColor,
        buttonBackground: Colors.black38,
        buttonText: Colors.white,
        disabled: ColorConstants.secondaryAppColor,
        error: Colors.red,
        labelInputColor: ColorConstants.labelInputColor,
        borderInputColor: ColorConstants.borderInputColor,
        iconColor: ColorConstants.iconColor,
      );
  static ThemeData get blueTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.lightScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryAppColor,
        primaryText: ColorConstants.lightPrimaryTextColor,
        secondaryText: ColorConstants.lightSecodaryTextColor,
        accentColor: ColorConstants.secondaryAppColor,
        divider: ColorConstants.divivedColor,
        buttonBackground: Colors.black38,
        buttonText: Colors.white,
        disabled: ColorConstants.secondaryAppColor,
        error: Colors.red,
        labelInputColor: ColorConstants.labelInputColor,
        borderInputColor: ColorConstants.borderInputColor,
        iconColor: ColorConstants.iconColor,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: ColorConstants.darkScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryDarkAppColor,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: ColorConstants.secondaryDarkAppColor,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: ColorConstants.secondaryDarkAppColor,
        disabled: ColorConstants.secondaryDarkAppColor,
        error: Colors.red,
        labelInputColor: ColorConstants.labelInputColor,
        borderInputColor: ColorConstants.borderInputColor,
        iconColor: ColorConstants.iconColor,
      );
}
