import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

class SearchTabCards {
  String text;
  String img;
  Color color;
  SearchTabCards({
    required this.text,
    required this.img,
    required this.color,
  });
}

class SearchTabDataCards {
  List<SearchTabCards> serachTabData = [
    SearchTabCards(
        text: "Podcasts", img: IconConstants.addtoPlaylist, color: redColor),
    SearchTabCards(
        text: "Live events",
        img: IconConstants.addtoQueueIcon,
        color: whiteColor),
    SearchTabCards(
        text: "Tamil", img: IconConstants.computerIcon, color: blackColor),
    SearchTabCards(
        text: "Made For You",
        img: IconConstants.goToSongRadio,
        color: yellowColor),
    SearchTabCards(
        text: "Hindi", img: IconConstants.homeFilledIcon, color: blueColor),
    SearchTabCards(
        text: "Telugu", img: IconConstants.libraryIcon, color: pinkColor),
    SearchTabCards(
        text: "New Release", img: IconConstants.likeIcon, color: purpleColor),
    SearchTabCards(
        text: "Charts",
        img: IconConstants.loopIcon,
        color: deepPurpleAccentColor),
    SearchTabCards(
        text: "Pop", img: IconConstants.moreIcon, color: orangeColor),
    SearchTabCards(
        text: "Trending", img: IconConstants.microphoneIcon, color: cyanColor),
    SearchTabCards(
        text: "Love",
        img: IconConstants.addtoQueueIcon,
        color: lightGreenColor),
    SearchTabCards(
        text: "Discover", img: IconConstants.computerIcon, color: redColor),
    SearchTabCards(
        text: "Mood", img: IconConstants.homeOutlinedIcon, color: purpleColor),
    SearchTabCards(
        text: "Radio", img: IconConstants.goToSongRadio, color: pinkColor),
    SearchTabCards(
        text: "Party", img: IconConstants.likeIcon, color: greyColor),
    SearchTabCards(
        text: "Devotional", img: IconConstants.loopIcon, color: brownColor),
    SearchTabCards(
        text: "Chill", img: IconConstants.nextTrcakIcon, color: searchBarColor),
    SearchTabCards(
        text: "Gaming", img: IconConstants.moreIcon, color: pinkColor),
  ];
}
