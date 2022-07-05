import 'package:di_example/core/res/app_colors.dart';
import 'package:flutter/material.dart';

import 'dimens.dart';

/// Light theme
ThemeData themeLight = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: AppColors.primary,
  disabledColor: AppColors.disable,
  hintColor: AppColors.hint,
  cardColor: AppColors.white,
  backgroundColor: AppColors.background,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.light().copyWith(primary: AppColors.primary),
  textTheme: TextTheme(
  bodyLarge: TextStyle(
      fontSize: Dimens.body1,
      fontWeight: FontWeight.bold,
      color: AppColors.white
    ),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: TextStyles.body1,
    color: AppColors.white,
    iconTheme: const IconThemeData(color: AppColors.primary),
  ),
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: AppColors.primary),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Dark theme
ThemeData themeDark = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: AppColors.primary,
  hintColor: AppColors.white.withOpacity(0.75),
  colorScheme: const ColorScheme.dark().copyWith(primary: AppColors.primary),
  textTheme: TextTheme(
    headline1: TextStyles.h1.copyWith(color: AppColors.white),
    headline2: TextStyles.h2.copyWith(color: AppColors.white),
    headline3: TextStyles.h3.copyWith(color: AppColors.white),
    headline4: TextStyles.h4.copyWith(color: AppColors.white),
    headline5: TextStyles.h5.copyWith(color: AppColors.white),
    headline6: TextStyles.h6.copyWith(color: AppColors.white),
    subtitle1: TextStyles.subtitle1.copyWith(color: AppColors.white),
    subtitle2: TextStyles.subtitle2.copyWith(color: AppColors.white),
    bodyText1: TextStyles.body1.copyWith(color: AppColors.white),
    bodyText2: TextStyles.body2.copyWith(color: AppColors.white),
    caption: TextStyles.caption.copyWith(color: AppColors.white),
    overline: TextStyles.overline.copyWith(color: AppColors.white),
    button: TextStyles.button.copyWith(color: AppColors.white),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: TextStyles.body1.copyWith(color: AppColors.white),
    iconTheme: const IconThemeData(color: AppColors.white),
    color: AppColors.primary,
  ),
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: AppColors.primaryLight),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardColor: AppColors.primary.withOpacity(0.75),
);

// TextStyles class
class TextStyles {
  TextStyles._();

  static TextStyle h1 = TextStyle(
    fontSize: Dimens.h1,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    letterSpacing: -1.5,
    color: AppColors.text,
  );

  static TextStyle h2 = TextStyle(
    fontSize: Dimens.h2,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    letterSpacing: -0.5,
    color: AppColors.text,
  );

  static TextStyle h3 = TextStyle(
    fontSize: Dimens.h3,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    color: AppColors.text,
  );

  static TextStyle h4 = TextStyle(
    fontSize: Dimens.h4,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.25,
    color: AppColors.text,
  );

  static TextStyle h5 = TextStyle(
    fontSize: Dimens.h5,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    color: AppColors.text,
  );

  static TextStyle h6 = TextStyle(
    fontSize: Dimens.h6,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 0.15,
    color: AppColors.text,
  );

  static TextStyle body1 = TextStyle(
    fontSize: Dimens.body1,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.5,
    color: AppColors.text,
  );

  static TextStyle body2 = TextStyle(
    fontSize: Dimens.body2,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.25,
    color: AppColors.text,
  );

  static TextStyle subtitle1 = TextStyle(
    fontSize: Dimens.subtitle1,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.15,
    color: AppColors.text,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: Dimens.subtitle2,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 0.1,
    color: AppColors.text,
  );

  static TextStyle button = TextStyle(
    fontSize: Dimens.button,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 1.25,
    color: AppColors.text,
  );

  static TextStyle caption = TextStyle(
    fontSize: Dimens.caption,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.4,
    color: AppColors.text,
  );

  static TextStyle overline = TextStyle(
    fontSize: Dimens.overline,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 1.5,
    color: AppColors.text,
  );
}

class BoxDecorations {
  BoxDecorations._();

  static BoxDecoration button = const BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.button],
  );

  static BoxDecoration card = const BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.card],
  );

  static BoxDecoration dialogAlt = const BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.dialogAlt],
  );

  static BoxDecoration bottomSheet = const BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(Dimens.cornerRadiusBottomSheet),
      topRight: Radius.circular(Dimens.cornerRadiusBottomSheet),
    ),
    boxShadow: [BoxShadows.dialog],
  );

  static BoxDecoration buttonMenu = const BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(Dimens.cornerRadius),
    ),
    boxShadow: [BoxShadows.buttonMenu],
  );
}

class BoxShadows {
  BoxShadows._();

  static const BoxShadow button = BoxShadow(
    color: AppColors.black20,
    blurRadius: 16.0,
    spreadRadius: 1.0,
  );

  static const BoxShadow card = BoxShadow(
    color: AppColors.black15,
    blurRadius: 12.0,
    spreadRadius: 1.0,
  );

  static const BoxShadow dialog = BoxShadow(
    color: AppColors.black10,
    offset: Offset(0, -4),
    blurRadius: 16.0,
  );

  static const BoxShadow dialogAlt = BoxShadow(
    color: AppColors.black25,
    offset: Offset(0, 4),
    blurRadius: 16.0,
  );

  static const BoxShadow buttonMenu = BoxShadow(
    color: AppColors.black25,
    blurRadius: 4.0,
  );
}
