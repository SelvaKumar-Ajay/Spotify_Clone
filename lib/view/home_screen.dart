import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    List<IndiasTopTemplate> indiasBestDataList = IndiasBest().indisBestData();
    List<EpisForYouTemplate> episDataList = EpisodeData().episData();
    List<RecentTemplate> recentDataList = RecentViewed().recentData();
    final currentSongData = Provider.of<CurrentSongData>(context);

    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.01, width * 0.01, 0, width * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(text: dateTimeGreeting(), width: width),
                rowRecentPlayList(
                  height: height,
                  width: width,
                  firstImage: NetworkImages.likedSong,
                  firstText: StringConstants.likedSongs,
                  secondImage: NetworkImages.romance,
                  secondText: StringConstants.romantic,
                ),
                sizedBox(height * 0.01, 0),
                rowRecentPlayList(
                  height: height,
                  width: width,
                  firstImage: NetworkImages.naruto,
                  firstText: StringConstants.narutoThemes,
                  secondImage: NetworkImages.ninetys,
                  secondText: StringConstants.ninetys,
                ),
                sizedBox(height * 0.01, 0),
                rowRecentPlayList(
                  height: height,
                  width: width,
                  firstImage: NetworkImages.sadSongs,
                  firstText: StringConstants.sadSongs,
                  secondImage: NetworkImages.vijay,
                  secondText: StringConstants.vijayHits,
                ),
                titleText(text: StringConstants.indiasBest, width: width),
                NormalPlaylistTemplate(
                    width: width,
                    height: height,
                    yourtopMixDataList: indiasBestDataList),
                titleText(text: StringConstants.yourTopMixes, width: width),
                StackedPlaylistTemplate(
                    width: width,
                    height: height,
                    yourtopMixDataList: yourtopMixDataList),
                titleText(text: StringConstants.episForYou, width: width),
                NormalTitleTemplate(
                  width: width,
                  height: height,
                  yourtopMixDataList: episDataList,
                ),
                titleText(text: StringConstants.recentPlayed, width: width),
                TitleOnlyTemplate(
                    width: width,
                    height: height,
                    yourtopMixDataList: recentDataList),
                NamedPlaylistTemplate(
                    width: width,
                    height: height,
                    yourtopMixDataList: yourtopMixDataList),
                titleText(text: StringConstants.yourFavArtist, width: width),
                ArtistsTemplate(
                    width: width,
                    height: height,
                    yourtopMixDataList: yourtopMixDataList),
                sizedBox(
                    StreamerBoxSizes(height: height, width: width).container,
                    0),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: StreamerBox(
            currentSongData: currentSongData,
            openAudio: currentSongData.data.openAudio,
            isPlaying: currentSongData.data.isPlaying,
            audioPlayer: currentSongData.data.audioPlayer,
            title: currentSongData.data.title,
            artist: currentSongData.data.artist,
            audioPath: currentSongData.data.audioPath,
            image: currentSongData.data.img,
            boxColor: currentSongData.data.color,
          ),
        ),
      ]),
    );
  }
}
