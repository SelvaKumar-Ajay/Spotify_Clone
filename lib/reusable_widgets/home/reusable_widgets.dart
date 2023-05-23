import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/data.dart';
import 'reusable_widgets.dart';
export 'home_screen_widgets.dart';
export 'normal_playlist_template.dart';
export 'stacked_playlist_template.dart';
export 'normal_title_template.dart';
export 'title_only_template.dart';
export 'artists_template.dart';

//CustomSizedBox
SizedBox sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

//(Your top mixes)- ListView buider for row of playlists
class StackedPlaylistTemplate extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const StackedPlaylistTemplate({
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

//Normal Title Playlist Template
class NormalTitleTemplate extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const NormalTitleTemplate({
    super.key,
    required this.width,
    required this.height,
    required this.yourtopMixDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: NormalTitleTemplateSizes(width: width, height: height)
          .normalTitleTotalSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: yourtopMixDataList.length,
        itemBuilder: (context, index) {
          return normalTitleTemplate(
              height: height,
              width: width,
              image: yourtopMixDataList[index].image,
              text: yourtopMixDataList[index].text,
              description: yourtopMixDataList[index].description);
        },
      ),
    );
  }
}

//Titke Only Template
class TitleOnlyTemplate extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const TitleOnlyTemplate({
    super.key,
    required this.width,
    required this.height,
    required this.yourtopMixDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TitleOnlyTemplateSizes(width: width, height: height).totalSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: yourtopMixDataList.length,
        itemBuilder: (context, index) {
          return titleOnlyTemplate(
            height: height,
            width: width,
            image: yourtopMixDataList[index].image,
            text: yourtopMixDataList[index].text,
          );
        },
      ),
    );
  }
}

//Playlist with a Header Name using list tile and Normal template
class NamedPlaylistTemplate extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const NamedPlaylistTemplate({
    super.key,
    required this.width,
    required this.height,
    required this.yourtopMixDataList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: CircleAvatar(
              child: Image(
                image: NetworkImage(yourtopMixDataList[0].image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            StringConstants.moreLike,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 10.0,
                color: greyColor.withOpacity(0.5),
                letterSpacing: 1.5),
          ),
          subtitle: Text(
            yourtopMixDataList[0].text,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 20.0, color: whiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
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
        ),
      ],
    );
  }
}

//Artist Template (your favourite artists row )
class ArtistsTemplate extends StatelessWidget {
  final double width;
  final double height;
  final List<TopMixDataTemplate> yourtopMixDataList;

  const ArtistsTemplate({
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
          return artistTemplate(
              height: height,
              width: width,
              image: yourtopMixDataList[index].image,
              text: yourtopMixDataList[index].text);
        },
      ),
    );
  }
}
