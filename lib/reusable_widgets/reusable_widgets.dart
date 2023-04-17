import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    {required String icon, required String label, bool? page}) {
  return BottomNavigationBarItem(
      icon: Image.asset(icon,
          height: 20.0,
          width: 10.0,
          color: page == false ? greyColor.withOpacity(0.5) : whiteColor),
      label: label);
}
