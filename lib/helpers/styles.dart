import 'dart:ui';

import 'package:flutter/material.dart';

///used to manage app themeData for both Dark and Light themes
class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: isDarkTheme ? Colors.black : Color(0xff1775d1),
      accentColor: isDarkTheme ? Colors.black : Color(0xff1775d1),
      splashColor: Colors.grey.withOpacity(0.1),
      canvasColor: isDarkTheme ? Colors.grey[900] : Colors.indigo[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      fontFamily: 'Ubuntu',
      accentColorBrightness: isDarkTheme ? Brightness.light : Brightness.dark,
      buttonTheme: isDarkTheme
          ? ButtonTheme.of(context).copyWith(
              buttonColor: Theme.of(context).primaryColor,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          : ButtonTheme.of(context).copyWith(
              buttonColor: Theme.of(context).primaryColor,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
      textTheme: isDarkTheme
          ? ThemeData.dark().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Colors.white,
                ),
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                headline1: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                headline2: TextStyle(
                  fontSize: 29,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                ),
                headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                ),
              )
          : ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                ),
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                ),
                headline1: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                 headline2: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                headline6: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                ),
                headline5: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                ),
              ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}