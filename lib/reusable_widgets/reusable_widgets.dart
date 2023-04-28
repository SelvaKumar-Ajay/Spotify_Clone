import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/data.dart';
import 'reusable_widgets.dart';
export 'appbar.dart';
export 'home_screen_widgets.dart';
export 'normal_playlist_template.dart';
export 'stacked_playlist_template.dart';

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

//(Your top mixes)- ListView buider for row of playlists
class StackedRowofPlaylist extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const StackedRowofPlaylist({
    super.key,
    required this.width,
    required this.height,
    required this.yourtopMixDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: YourtopMixSizes(height: height, width: width).sBSizeTotalTopMix,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: yourtopMixDataList.length,
        itemBuilder: (context, index) {
          return yourTopMixesTemplate(
              height: height,
              width: width,
              color: yourtopMixDataList[index].color,
              image: yourtopMixDataList[index].image,
              text: yourtopMixDataList[index].text,
              description: yourtopMixDataList[index].description);
        },
      ),
    );
  }
}

//NormalPlaylistTemplate
class NormalPlaylistTemplate extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const NormalPlaylistTemplate({
    super.key,
    required this.width,
    required this.height,
    required this.yourtopMixDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: NormalPlaylistTemplateSizes(width: width, height: height)
          .normalPlaylistSizedBox,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: yourtopMixDataList.length,
        itemBuilder: (context, index) {
          return normalPlayListTemplate(
              height: height,
              width: width,
              image: yourtopMixDataList[index].image,
              description: yourtopMixDataList[index].description);
        },
      ),
    );
  }
}
