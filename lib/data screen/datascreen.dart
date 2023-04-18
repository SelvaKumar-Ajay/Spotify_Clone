import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

class DataWidgets {
  static List<Widget> dataWidgets = [
    Center(
      child: Image.asset(IconConstants.homeFilledIcon,
          color: whiteColor, height: 30.0),
    ),
    Center(
      child: Image.asset(IconConstants.searchIcon,
          color: whiteColor, height: 30.0),
    ),
    Center(
      child: Image.asset(IconConstants.libraryIcon,
          color: whiteColor, height: 30.0),
    ),
  ];
}
