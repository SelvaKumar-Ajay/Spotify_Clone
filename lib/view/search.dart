// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/current_song.dart';
import 'package:spotify/data/search/cards.dart';
import 'package:spotify/reusable_widgets/search/reusable_widgets.dart';
import 'package:spotify/reusable_widgets/streamer_box.dart';
// import 'package:spotify/view/songs_list.dart';
import '../reusable_widgets/home/reusable_widgets.dart';

class SearchScreen extends StatefulWidget {
  // final String title;
  // final String artist;
  // final String image;
  // final String url;
  const SearchScreen({
    super.key,
    // required this.title,
    // required this.artist,
    // required this.image,
    // required this.url
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchTabCards> searchTabData = SearchTabDataCards().serachTabData;
  // final audioPath1 = "lib/musics/Vaseegara.mp3";
  // final audioPath2 = "lib/musics/PathuThala.mp3";
  // final audioPath3 = "lib/musics/Arabu-Naade.mp3";
  String pageKey() {
    return "streamerBox";
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("Search");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final currentSongData = Provider.of<CurrentSongData>(context);

    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(text: StringConstants.searchHeader, width: width),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        height: SearchSizes(height: height, width: width)
                            .containerheight,
                        width: SearchSizes(height: height, width: width)
                            .containerwidth,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                SearchSizes(height: height, width: width)
                                    .iconPaddingAll,
                              ),
                              child: Image.asset(
                                IconConstants.searchIcon,
                                height:
                                    SearchSizes(height: height, width: width)
                                        .iconheight,
                                width: SearchSizes(height: height, width: width)
                                    .iconheight,
                                color: blackColor,
                              ),
                            ),
                            const Text(
                              StringConstants.serachButtonText,
                              style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                wordSpacing: 3.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        IconConstants.microphoneIcon,
                        color: whiteColor,
                        height: SearchSizes(height: height, width: width)
                            .micIconHeight,
                        width: SearchSizes(height: height, width: width)
                            .micIconWidth,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SearchSizes(height: height, width: width)
                            .browseAllPadding),
                    child: const Text(
                      StringConstants.browseAll,
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          letterSpacing: 0.5),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing:
                            ContainerSizes(height: height, width: width)
                                .crossMainAxisSpaces,
                        mainAxisSpacing:
                            ContainerSizes(height: height, width: width)
                                .crossMainAxisSpaces,
                        childAspectRatio: 2.0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => AudioPlayerScreen(
                        //       audioPlayer: currentSongData.data.audioPlayer,
                        //     ),
                        //   ),
                        // );
                        // player.play(AssetSource("Vaseegara.mp3"));
                      },
                      child: cards(
                          height: height,
                          width: width,
                          color: searchTabData[index].color,
                          img: searchTabData[index].img,
                          text: searchTabData[index].text),
                    ),
                    itemCount: searchTabData.length,
                  ),
                ],
              ),
            ),
            sizedBox(
                StreamerBoxSizes(height: height, width: width).container, 0),
          ],
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
    ]);
  }
}
