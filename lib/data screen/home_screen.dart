import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/functions/functions.dart';
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
    final double imgBoxWidth = (width * 0.4) * 0.3;
    final double nonImgBoxWidth = width - imgBoxWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            dateTimeGreeting(),
            style: const TextStyle(
              color: whiteColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.4),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0)),
            height: height * 0.1,
            width: width * 0.4,
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: height * 0.1,
                width: imgBoxWidth,
                child: Image.asset(IconConstants.libraryIcon),
              ),
              SizedBox(
                height: height * 0.1,
                width: nonImgBoxWidth,
                child: const Text(StringConstants.likedSongs),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
