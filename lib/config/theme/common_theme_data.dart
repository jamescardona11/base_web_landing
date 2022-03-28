import 'package:flutter/material.dart';
import 'package:base_web_landing/config/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

final commonThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  primaryColorLight: kPrimaryColorLight,
  scaffoldBackgroundColor: kWhiteColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kAccentColor,
    brightness: Brightness.dark,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(140, 45),
      primary: kWhiteColor,
      onPrimary: kBlackColor,
      textStyle: buttonStyle,
    ),
  ),
);

final headline1 = GoogleFonts.notoSans(
  color: kBlackColor,
  fontWeight: FontWeight.w800,
);

final headline2 = GoogleFonts.monda(
  color: kBlackColor,
  fontWeight: FontWeight.w300,
);

final headline3 = GoogleFonts.monda(
  color: kCreamColor,
  fontWeight: FontWeight.w500,
);

final headline4 = GoogleFonts.notoSans(
  color: kBlackColor,
  fontWeight: FontWeight.w600,
);

final headline5 = GoogleFonts.fugazOne(
  color: kGrayColorOpacity,
  fontWeight: FontWeight.w300,
);

final subtitle1 = GoogleFonts.notoSans(
  color: kBlackColor,
  fontWeight: FontWeight.w800,
);

final subtitle2 = GoogleFonts.delius(
  color: kGrayColor,
  fontWeight: FontWeight.w400,
);

final buttonStyle = GoogleFonts.notoSans(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

//gugi
