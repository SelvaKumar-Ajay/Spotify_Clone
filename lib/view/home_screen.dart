import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/functions/functions.dart';
import 'package:spotify/reusable_widgets/home/reusable_widgets.dart';
import 'package:spotify/reusable_widgets/streamer_box.dart';

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

    return Stack(children: [
      SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(width * 0.01, width * 0.01, 0, width * 0.01),
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
              StackedPlaylistTemplate(
                  width: width,
                  height: height,
                  yourtopMixDataList: yourtopMixDataList),
              titleText(text: StringConstants.indiasBest, width: width),
              NormalPlaylistTemplate(
                  width: width,
                  height: height,
                  yourtopMixDataList: yourtopMixDataList),
              titleText(text: StringConstants.episForYou, width: width),
              NormalTitleTemplate(
                width: width,
                height: height,
                yourtopMixDataList: yourtopMixDataList,
              ),
              titleText(text: StringConstants.recentPlayed, width: width),
              TitleOnlyTemplate(
                  width: width,
                  height: height,
                  yourtopMixDataList: yourtopMixDataList),
              NamedPlaylistTemplate(
                  width: width,
                  height: height,
                  yourtopMixDataList: yourtopMixDataList),
              titleText(text: StringConstants.yourFavArtist, width: width),
              ArtistsTemplate(
                  width: width,
                  height: height,
                  yourtopMixDataList: yourtopMixDataList),
              sizedBox(30, 0),
            ],
          ),
        ),
      ),
      const Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: StreamerBox(
          title: "Title of Song with rock lee",
          artist: 'Naruto',
          audioPath: 'lib/musics/Arabu-Naade.mp3',
          image:
              "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtaWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          boxColor: Colors.blue,
        ),
      ),
    ]);
  }
}
