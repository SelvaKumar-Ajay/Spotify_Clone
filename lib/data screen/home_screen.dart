import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/functions/functions.dart';
import 'package:spotify/reusable_widgets/reusable_widgets.dart';
// import 'package:spotify/reusable_widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateTimeGreeting(),
            style: const TextStyle(
              color: whiteColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          sizedBox(20, 0),
          rowRecentPlayList(
            height: height,
            width: width,
            firstImage: IconConstants.likeIcon,
            firstText: StringConstants.likedSongs,
            secondImage: IconConstants.likeIcon,
            secondText: StringConstants.likedSongs,
          ),
          sizedBox(10, 0),
          rowRecentPlayList(
            height: height,
            width: width,
            firstImage: IconConstants.microphoneIcon,
            firstText: StringConstants.likedSongs,
            secondImage: IconConstants.microphoneIcon,
            secondText: StringConstants.goodMorning,
          ),
          sizedBox(10, 0),
          rowRecentPlayList(
            height: height,
            width: width,
            firstImage: IconConstants.nextTrcakIcon,
            firstText: StringConstants.spotifyClone,
            secondImage: IconConstants.loopIcon,
            secondText: StringConstants.search,
          ),
          titleText(text: StringConstants.yourTopMixes)
        ],
      ),
    );
  }
}
