import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

class AppBarClass {
  static AppBar homeScreenAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Image.asset(
              IconConstants.thunderIcon,
              color: whiteColor,
              height: 20.0,
              width: 22.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Image.asset(
              IconConstants.settingsIcon,
              color: whiteColor,
              height: 20.0,
              width: 20.0,
            )
          ]),
        )
      ],
    );
  }
}
