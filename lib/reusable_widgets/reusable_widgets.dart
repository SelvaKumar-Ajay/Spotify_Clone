import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
export 'appbar.dart';
export 'home_screen_widgets.dart';

//BottomNavigationBar Item
BottomNavigationBarItem bottomNavigationBarItem(
    {required String icon, required String label, bool? page}) {
  return BottomNavigationBarItem(
      icon: Image.asset(icon,
          height: 20.0,
          width: 20.0,
          color: page == false ? greyColor.withOpacity(0.5) : whiteColor),
      label: label);
}

//CustomSizedBox
SizedBox sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
