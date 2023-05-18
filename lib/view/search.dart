// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/search/cards.dart';
import 'package:spotify/reusable_widgets/search/reusable_widgets.dart';
import 'package:spotify/view/songs_list.dart';
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
  AudioPlayer player = AudioPlayer();
  // Duration duration = Duration(seconds: 90);
  Duration position = Duration.zero;
  bool isPlaying = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _initAudioPlayer();
  // }

  // void _initAudioPlayer() {
  //   player = AudioPlayer();
  //   player.onDurationChanged.listen((dura) {
  //     setState(() {
  //       duration = dura;
  //     });
  //   });
  //   player.onPositionChanged.listen((p) {
  //     setState(() {
  //       position = p;
  //     });
  //   });
  // }

  // void play() async {
  //   await player.play(AssetSource('lib/musics/Vaseegara.mp3'));
  //   setState(() {
  //     isPlaying = true;
  //   });
  // }

  // void pause() async {
  //   await player.pause();
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
                              height: SearchSizes(height: height, width: width)
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SongPage(),
                        ),
                      );
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
          sizedBox(25.0, 0),

          //Streamer box
          Container(
            color: redColor,
            height: width * 0.2,
            child: Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtaWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                      height: width * 0.18,
                      width: width * 0.18,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //    Marquee(
                        //   text: "Title of Song  sensei guy sensei...",
                        //   scrollAxis: Axis.horizontal,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   blankSpace: 20.0,
                        //   velocity: 100.0,
                        //   pauseAfterRound: const Duration(seconds: 1),
                        //   startPadding: 10.0,
                        //   accelerationDuration: const Duration(seconds: 1),
                        //   accelerationCurve: Curves.linear,
                        //   decelerationDuration:
                        //       const Duration(milliseconds: 500),
                        //   decelerationCurve: Curves.easeOut,
                        //   style: const TextStyle(
                        //     color: whiteColor,
                        //     fontSize: 13.0,
                        //   ),
                        // ),

                        const Text(
                          "Title of Song with rock lee and his sensei guy sensei...",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          "desc of Song",
                          style: TextStyle(
                            color: whiteColor.withOpacity(0.5),
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      IconConstants.likeIcon,
                      width: width * 0.04,
                      height: width * 0.04,
                      color: whiteColor,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.pause))
                ],
              ),
            ),
          ),
          //Slider
          Row(
            children: [
              // Text('${position.inSeconds}'),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0.0,
                    ),
                    thumbColor: transparentColor,
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0.0,
                    ),
                  ),
                  child: Slider(
                      activeColor: whiteColor,
                      min: 0,
                      max: 100,
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) {
                        // player.seek(Duration(seconds: value.toInt()));
                        setState(() {
                          position = Duration(seconds: value.toInt());
                        });
                      }),
                ),
              ),
              // Text('${duration.inSeconds}'),
            ],
          )
        ],
      ),
    );
  }
}
