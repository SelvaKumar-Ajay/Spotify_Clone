import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

// Row of Recent Playlist
Padding rowRecentPlayList({
  required double height,
  required double width,
  required String firstImage,
  required String secondImage,
  required String firstText,
  required String secondText,
}) {
  return Padding(
    padding: EdgeInsets.only(right: width * 0.01),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        recentViewedPlaylist(
            height: height, width: width, img: firstImage, text: firstText),
        // SizedBox(
        //   width: width * 0.01,
        // ),
        recentViewedPlaylist(
            height: height, width: width, img: secondImage, text: secondText)
      ],
    ),
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
        borderRadius: BorderRadius.circular(4.0)),
    clipBehavior: Clip.antiAlias,
    height: RowRecentPlaylist(height: height, width: width).boxDecorationHeight,
    width: RowRecentPlaylist(height: height, width: width).boxDecorationWidth,
    child: Row(children: [
      // ignore: sized_box_for_whitespace
      Container(
        height: height * 0.1,
        width: RowRecentPlaylist(height: height, width: width).imgBoxWidth,
        child: Image(image: NetworkImage(img), fit: BoxFit.cover),
      ),
      SizedBox(
          width: RowRecentPlaylist(height: height, width: width)
              .spaceSizedBoxWidth),
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
Widget titleText({
  required String text,
  required width,
}) =>
    Container(
      margin: EdgeInsets.fromLTRB(
          Titletext(width: width).leftSpace,
          Titletext(width: width).topSpace,
          0,
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
