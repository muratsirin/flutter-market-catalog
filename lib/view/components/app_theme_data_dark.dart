import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_catalog_final/utils/constants.dart';

ThemeData appThemeDataDark() {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColorDark,
    primaryIconTheme: IconThemeData(
      color: kPrimaryIconColorDark,
    ),
    textTheme: TextTheme(
      bodyText2: GoogleFonts.raleway(
        textStyle: TextStyle(
          fontSize: 18,
          color: kTextColorDark,
        ),
      ),
      subtitle1: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: kTextColorDark,
        ),
      ),
    ),
    scaffoldBackgroundColor: kScaffoldBackgroundColorDark,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: GoogleFonts.raleway(
          textStyle: TextStyle(
            color: kAppBarTextColorDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      color: kAppBarColorDark,
    ),
    iconTheme: IconThemeData(
      color: kIconColorDark,
    ),
    cardColor: kContainerColorDark,
  );
}
