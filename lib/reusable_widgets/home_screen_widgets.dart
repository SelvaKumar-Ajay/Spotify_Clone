import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

// Row of Recent Playlist
Row rowRecentPlayList({
  required double height,
  required double width,
  required String firstImage,
  required String secondImage,
  required String firstText,
  required String secondText,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      recentViewedPlaylist(
          height: height, width: width, img: firstImage, text: firstText),
      SizedBox(
        width: RowRecentPlaylist(height: height, width: width)
            .rowRecentPlaylistWidth,
      ),
      recentViewedPlaylist(
          height: height, width: width, img: secondImage, text: secondText)
    ],
  );
}

//Recently viewed Playlist Design
Container recentViewedPlaylist({
  required height,
  required width,
  required String img,
  required String text,
}) {
  return Container(
    decoration: BoxDecoration(
        color: searchBarColor.withOpacity(0.4),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0)),
    clipBehavior: Clip.antiAlias,
    height: RowRecentPlaylist(height: height, width: width).boxDecorationHeight,
    width: RowRecentPlaylist(height: height, width: width).boxDecorationWidth,
    child: Row(children: [
      // ignore: sized_box_for_whitespace
      Container(
        height: height * 0.1,
        width: RowRecentPlaylist(height: height, width: width).imgBoxWidth,
        child: Image.asset(img, fit: BoxFit.cover),
      ),
      SizedBox(width: (width * 0.2) * 0.1),
      Expanded(
        child: SizedBox(
          height:
              RowRecentPlaylist(height: height, width: width).containerHeight,
          width: RowRecentPlaylist(height: height, width: width).nonImgBoxWidth,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.0),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false),
          ),
        ),
      ),
    ]),
  );
}

//Title Text
Container titleText({
  required text,
  required double width,
}) =>
    Container(
      margin: EdgeInsets.fromLTRB(0, Titletext(width: width).topSpace, 0,
          Titletext(width: width).bottomSpace),
      child: Text(
        text,
        style: const TextStyle(
          color: whiteColor,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

//Your Top mixes template
Column yourTopMixesTemplate({
  required double height,
  required double width,
  required Color color,
  required String image,
  required String text,
  required String description,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
            // color: blueColor,
            border: Border(
                bottom: BorderSide(
                    color: color,
                    width: YourtopMixSizes(height: height, width: width)
                        .bottomBarWidth))),
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            YourtopMixSizes(height: height, width: width).rightMarginSize,
            YourtopMixSizes(height: height, width: width).containerTextSpace),
        height: YourtopMixSizes(height: height, width: width).sizeOfContainer,
        width: YourtopMixSizes(height: height, width: width).sizeOfContainer,
        child: Stack(
          children: [
            Image.asset(image, color: color),
            Padding(
              padding: EdgeInsets.all(
                  YourtopMixSizes(height: height, width: width).paddingSize),
              child: Align(
                alignment: Alignment.topLeft,
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: YourtopMixSizes(height: height, width: width)
                      .spotifyIconHeight,
                  width: YourtopMixSizes(height: height, width: width)
                      .spotifyIconWidth,
                  child: Image.asset(
                    IconConstants.spotifyIcon,
                    color: whiteColor,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: YourtopMixSizes(height: height, width: width)
                      .bottomPadding),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: YourtopMixSizes(height: height, width: width)
                      .bottomTextContainerHeight,
                  decoration: BoxDecoration(
                      color: transparentColor,
                      border: Border(
                          left: BorderSide(
                              color: color,
                              width:
                                  YourtopMixSizes(height: height, width: width)
                                      .bottomtextContainerBorderWidth))),
                  child: Text("  $text"),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: YourtopMixSizes(height: height, width: width).textBoxHeight,
        width: YourtopMixSizes(height: height, width: width).sizeOfContainer,
        child: Text(
          description,
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.0,
            color: greyColor.withOpacity(0.4),
          ),
        ),
      ),
    ],
  );
}
