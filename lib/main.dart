import 'package:flutter/material.dart';
import 'package:spotify/home_page.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.spotifyClone,
      theme: theme,
      home: const HomePage(),
    );
  }
}
