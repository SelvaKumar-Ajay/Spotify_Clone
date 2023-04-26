import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

//BottomNavigationBar Item
BottomNavigationBarItem bottomNavigationBarItem(
    {required String icon, required String label, bool? page}) {
  return BottomNavigationBarItem(
      icon: Image.asset(icon,
          height: 20.0,
          width: 20.0,
          color: page == false ? greyColor.withOpacity(0.5) : whiteColor),
      label: label);
}

//CustomSizedBox
SizedBox sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

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
                    fontWeight: FontWeight.w500, fontSize: 16.0),
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
Container titleText({required text}) => Container(
      margin: const EdgeInsets.fromLTRB(0, 25.0, 0, 15.0),
      child: Text(
        text,
        style: const TextStyle(
          color: whiteColor,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
