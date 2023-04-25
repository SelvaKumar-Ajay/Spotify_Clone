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
        width: ((width * 0.4) * 0.1) * 0.5,
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
  final double imgBoxWidth = (width * 0.4) * 0.4;
  final double nonImgBoxWidth = (width * 0.4) * 0.7;
  return Container(
    decoration: BoxDecoration(
        color: searchBarColor.withOpacity(0.4),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0)),
    clipBehavior: Clip.antiAlias,
    height: height * 0.1,
    width: ((width * 0.5) * 0.9) * 1.03,
    child: Row(children: [
      // ignore: sized_box_for_whitespace
      Container(
        height: height * 0.1,
        width: imgBoxWidth,
        child: Image.asset(img, fit: BoxFit.cover),
      ),
      SizedBox(width: (width * 0.2) * 0.1),
      Expanded(
        child: SizedBox(
          height: height * 0.1,
          width: nonImgBoxWidth,
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
