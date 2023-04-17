import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: greyColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: whiteColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: whiteColor),
        unselectedIconTheme: IconThemeData(color: greyColor),
        selectedLabelStyle: TextStyle(color: whiteColor),
        selectedItemColor: whiteColor,
        unselectedItemColor: greyColor,
        unselectedLabelStyle: TextStyle(color: greyColor),
        backgroundColor: backgroundColor,
        elevation: 0));
