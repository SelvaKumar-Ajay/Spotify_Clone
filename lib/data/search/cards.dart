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
      text: "Podcasts",
      img:
          "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YWxidW18ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: redColor,
    ),
    SearchTabCards(
      text: "Live events",
      img:
          "https://images.unsplash.com/photo-1619983081563-430f63602796?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YWxidW18ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: whiteColor,
    ),
    SearchTabCards(
      text: "Tamil",
      img:
          "https://images.unsplash.com/photo-1584679109597-c656b19974c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YWxidW18ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: blueColor,
    ),
    SearchTabCards(
      text: "Made For You",
      img:
          "https://images.unsplash.com/photo-1605286111427-67133b091012?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YWxidW18ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: yellowColor,
    ),
    SearchTabCards(
      text: "Hindi",
      img:
          "https://images.unsplash.com/photo-1505672984986-b7c468c7a134?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFsYnVtfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      color: blueColor,
    ),
    SearchTabCards(
      text: "Telugu",
      img:
          "https://images.unsplash.com/photo-1616663395403-2e0052b8e595?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGFsYnVtfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      color: pinkColor,
    ),
    SearchTabCards(
      text: "New Release",
      img:
          "https://images.unsplash.com/photo-1500099817043-86d46000d58f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: purpleColor,
    ),
    SearchTabCards(
      text: "Charts",
      img:
          "https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: deepPurpleAccentColor,
    ),
    SearchTabCards(
      text: "Pop",
      img:
          "https://images.unsplash.com/photo-1599689018002-8f235eae9293?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: orangeColor,
    ),
    SearchTabCards(
      text: "Trending",
      img:
          "https://images.unsplash.com/photo-1510759704643-849552bf3b66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: cyanColor,
    ),
    SearchTabCards(
      text: "Love",
      img:
          "https://images.unsplash.com/photo-1596244538883-6daa3a4c8f69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: lightGreenColor,
    ),
    SearchTabCards(
      text: "Discover",
      img:
          "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: redColor,
    ),
    SearchTabCards(
      text: "Mood",
      img:
          "https://images.unsplash.com/photo-1516900448138-898720b936c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YWxidW0lMjBjb3ZlcnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      color: purpleColor,
    ),
    SearchTabCards(
      text: "Radio",
      img:
          "https://images.unsplash.com/photo-1494894194458-0174142560c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGFsYnVtJTIwY292ZXJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      color: pinkColor,
    ),
    SearchTabCards(
      text: "Party",
      img:
          "https://images.unsplash.com/photo-1494894194458-0174142560c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGFsYnVtJTIwY292ZXJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      color: greyColor,
    ),
    SearchTabCards(
      text: "Devotional",
      img:
          "https://images.unsplash.com/photo-1494894194458-0174142560c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGFsYnVtJTIwY292ZXJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      color: brownColor,
    ),
    SearchTabCards(
      text: "Chill",
      img:
          "https://images.unsplash.com/photo-1494894194458-0174142560c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGFsYnVtJTIwY292ZXJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      color: searchBarColor,
    ),
    SearchTabCards(
      text: "Gaming",
      img:
          "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2FtZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      color: pinkColor,
    ),
  ];
}
