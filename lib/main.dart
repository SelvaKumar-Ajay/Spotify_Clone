import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/data/current_song.dart';
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
    return ChangeNotifierProvider(
      create: (context) => CurrentSongData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.spotifyClone,
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}
