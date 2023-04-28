import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/data.dart';
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
    List<TopMixDataTemplate> yourtopMixDataList =
        TopMixData().yourTopMixesData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(text: dateTimeGreeting(), width: width),
          rowRecentPlayList(
            height: height,
            width: width,
            firstImage: IconConstants.likeIcon,
            firstText: StringConstants.likedSongs,
            secondImage: IconConstants.likeIcon,
            secondText: StringConstants.likedSongs,
          ),
          sizedBox(height * 0.01, 0),
          rowRecentPlayList(
            height: height,
            width: width,
            firstImage: IconConstants.microphoneIcon,
            firstText: StringConstants.likedSongs,
            secondImage: IconConstants.microphoneIcon,
            secondText: StringConstants.goodMorning,
          ),
          sizedBox(height * 0.01, 0),
          rowRecentPlayList(
            height: height,
            width: width,
            firstImage: IconConstants.nextTrcakIcon,
            firstText: StringConstants.spotifyClone,
            secondImage: IconConstants.loopIcon,
            secondText: StringConstants.search,
          ),
          titleText(text: StringConstants.yourTopMixes, width: width),
          StackedRowofPlaylist(
              width: width,
              height: height,
              yourtopMixDataList: yourtopMixDataList),
          titleText(text: StringConstants.indiasBest, width: width),
          NormalPlaylistTemplate(
              width: width,
              height: height,
              yourtopMixDataList: yourtopMixDataList)
        ],
      ),
    );
  }
}
