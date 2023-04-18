import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data%20screen/home_screen.dart';

class DataWidgets {
  final String dateTime;
  static List<Widget> dataWidgets = [
    const HomeScreen(),
    Center(
      child: Image.asset(IconConstants.searchIcon,
          color: whiteColor, height: 30.0),
    ),
    Center(
      child: Image.asset(IconConstants.libraryIcon,
          color: whiteColor, height: 30.0),
    ),
  ];

  DataWidgets({required this.dateTime});
}
