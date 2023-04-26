//Sizes of yourTopMixes or rowOfTopMixes in reusablewidgets.dart
class YourtopMixes {
  double width;
  double height;
  YourtopMixes({
    required this.height,
    required this.width,
  });
  late double sizeOfContainer =
      (width * 0.4) * 0.9; //(40% from the size of width) then 90% from the 40%
  late double rightMarginSize = width * 0.1;
  late double bottomBarWidth = sizeOfContainer * 0.06;
  late double spotifyIconHeight = sizeOfContainer * 0.09;
  late double spotifyIconWidth =
      sizeOfContainer * 0.09; //20% from the size of Container
  late double paddingSize =
      sizeOfContainer * 0.04; //4% from the Size of Container
  late double bottomTextContainerHeight = sizeOfContainer * 0.1;
  late double bottomtextContainerBorderWidth = sizeOfContainer * 0.05;
  late double bottomPadding = sizeOfContainer * 0.06;
  // late double yourMixContainer = width * 0.4;
  // late double yourMixContainer = width * 0.4;
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
  late double boxDecorationHeight = (height * 0.1) * 0.9;
  late double containerHeight = (height * 0.1) * 0.9;
  late double boxDecorationWidth = ((width * 0.5) * 0.9) * 1.03;
  late double spaceSizedBoxWidth = (width * 0.2) * 0.1;
  late double rowRecentPlaylistWidth = ((width * 0.4) * 0.1) * 0.5;
  // late double yourMixContainer = width * 0.4;
  // late double yourMixContainer = width * 0.4;
}
