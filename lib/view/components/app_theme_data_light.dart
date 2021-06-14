import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_catalog_final/utils/constants.dart';

ThemeData appThemeDataLight() {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColorLight,
    primaryIconTheme: IconThemeData(
      color: kPrimaryIconColorLight,
    ),
    textTheme: TextTheme(
      bodyText2: GoogleFonts.raleway(
        textStyle: TextStyle(
          fontSize: 18,
          color: kTextColorLight,
        ),
      ),
      subtitle1: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: kTextColorLight,
        ),
      ),
    ),
    scaffoldBackgroundColor: kScaffoldBackgroundColorLight,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: GoogleFonts.raleway(
          textStyle: TextStyle(
            color: kAppBarTextColorLight,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      color: kAppBarColorLight,
    ),
    iconTheme: IconThemeData(
      color: kIconColorLight,
    ),
  );
}
