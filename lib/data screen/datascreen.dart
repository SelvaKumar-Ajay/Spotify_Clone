import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/view/home_screen.dart';
import 'package:spotify/view/search.dart';

class DataWidgets {
  final String dateTime;
  static List<Widget> dataWidgets = [
    const HomeScreen(),
    const SearchScreen(),
    Center(
      child: Image.asset(IconConstants.libraryIcon,
          color: whiteColor, height: 30.0),
    ),
  ];

  DataWidgets({required this.dateTime});
}
