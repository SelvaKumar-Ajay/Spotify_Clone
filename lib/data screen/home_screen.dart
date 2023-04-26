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
          titleText(text: StringConstants.yourTopMixes),
          Container(
            decoration: BoxDecoration(
                color: blueColor,
                border: Border(
                    bottom: BorderSide(
                        color: redColor,
                        width: YourtopMixes(height: height, width: width)
                            .bottomBarWidth))),
            margin: EdgeInsets.only(
                right:
                    YourtopMixes(height: height, width: width).rightMarginSize),
            height: YourtopMixes(height: height, width: width).sizeOfContainer,
            width: YourtopMixes(height: height, width: width).sizeOfContainer,
            child: Stack(
              children: [
                Image.asset(IconConstants.shareIcon),
                Padding(
                  padding: EdgeInsets.all(
                      YourtopMixes(height: height, width: width).paddingSize),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: YourtopMixes(height: height, width: width)
                          .spotifyIconHeight,
                      width: YourtopMixes(height: height, width: width)
                          .spotifyIconWidth,
                      child: Image.asset(
                        IconConstants.spotifyIcon,
                        color: whiteColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: YourtopMixes(height: height, width: width)
                          .bottomPadding),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: YourtopMixes(height: height, width: width)
                          .bottomTextContainerHeight,
                      decoration: BoxDecoration(
                          color: transparentColor,
                          border: Border(
                              left: BorderSide(
                                  color: redColor,
                                  width:
                                      YourtopMixes(height: height, width: width)
                                          .bottomtextContainerBorderWidth))),
                      child: Text("  ${StringConstants.popMix}"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
