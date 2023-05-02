// Artist Template (your favourite artitst playlist)
class ArtistTemplateSizes extends YourtopMixSizes {
  @override
  // ignore: overridden_fields
  double width;
  @override
  // ignore: overridden_fields
  double height;
  ArtistTemplateSizes({
    required this.width,
    required this.height,
  }) : super(height: height, width: width);

  late double artistCircularSize = sizeOfContainer * 0.5;
  //
}

//Title only playlist Template Sizes
class TitleOnlyTemplateSizes {
  double width;
  double height;
  TitleOnlyTemplateSizes({
    required this.width,
    required this.height,
  });

  late double sizeOfContainer =
      (width * 0.4) * 0.6; //(40% from the size of width) then 90% from the 40%
  late double rightMarginSize = width * 0.05;
  late double bottomBarWidth = sizeOfContainer * 0.06;
  late double textBoxHeight = sizeOfContainer * 0.25;
  late double containerTextSpace = sizeOfContainer * 0.1;
  late double totalSize =
      (sizeOfContainer + textBoxHeight + containerTextSpace) +
          sizeOfContainer * 0.2;
}

//Normal Playlist With title TemplateSizes
class NormalTitleTemplateSizes extends YourtopMixSizes {
  @override
  // ignore: overridden_fields
  double width;
  @override
  // ignore: overridden_fields
  double height;
  NormalTitleTemplateSizes({
    required this.width,
    required this.height,
  }) : super(height: height, width: width);

  late double textWidth = sizeOfContainer;
  late double textHeight = sizeOfContainer * 0.1;
  late double normalTitleTotalSize = sBSizeTotalTopMix + textHeight;
}

//NormalPlaylistTemplateSizes
class NormalPlaylistTemplateSizes extends YourtopMixSizes {
  @override
  // ignore: overridden_fields
  double width;
  @override
  // ignore: overridden_fields
  double height;
  NormalPlaylistTemplateSizes({
    required this.width,
    required this.height,
  }) : super(height: height, width: width);

  late double normalPlaylistSizedBox = sBSizeTotalTopMix;
}

//Sizes of yourTopMixes or rowOfTopMixes in reusablewidgets.dart
class YourtopMixSizes {
  double width;
  double height;
  YourtopMixSizes({
    required this.height,
    required this.width,
  });
  late double sizeOfContainer =
      (width * 0.4) * 0.9; //(40% from the size of width) then 90% from the 40%
  late double rightMarginSize = width * 0.05;
  late double bottomBarWidth = sizeOfContainer * 0.06;
  late double spotifyIconHeight = sizeOfContainer * 0.15;
  late double spotifyIconWidth =
      sizeOfContainer * 0.15; //20% from the size of Container
  late double paddingSize =
      sizeOfContainer * 0.04; //4% from the Size of Container
  late double bottomTextContainerHeight = sizeOfContainer * 0.1;
  late double bottomtextContainerBorderWidth = sizeOfContainer * 0.05;
  late double bottomPadding = sizeOfContainer * 0.06;
  late double textBoxHeight = sizeOfContainer * 0.25;
  late double containerTextSpace = sizeOfContainer * 0.1;
  //ListView builder Sized Box size (Total of Image Conatiner,Text and Space Between them)
  late double sBSizeTotalTopMix =
      sizeOfContainer + containerTextSpace + textBoxHeight;
}

//Sizes of RecentPlaylist or RowRecentPlaylist in reusablewidgets.dart
class RowRecentPlaylist {
  double width;
  double height;
  RowRecentPlaylist({
    required this.height,
    required this.width,
  });
  late double imgBoxWidth = (width * 0.4) * 0.4;
  late double nonImgBoxWidth = (width * 0.4) * 0.7;
  late double containerHeight = (height * 0.1) * 0.9;
  late double boxDecorationHeight = containerHeight;
  late double boxDecorationWidth = ((width * 0.5) * 0.9) * 1.05;
  late double spaceSizedBoxWidth = (width * 0.2) * 0.1;
  // late double rowSpaceWidth = ((width * 0.4) * 0.1) * 0.6;
  // late double yourMixContainer = width * 0.1;
  // late double yourMixContainer = width * 0.4;
  // late double yourMixContainer = width * 0.4;
  // late double yourMixContainer = width * 0.4;
}

class Titletext {
  double width;
  Titletext({
    required this.width,
  });
  late double topSpace = width * 0.06;
  late double bottomSpace = width * 0.03;
}
