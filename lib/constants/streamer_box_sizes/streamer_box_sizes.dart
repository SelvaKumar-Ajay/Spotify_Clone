class StreamerBoxSizes {
  double height;
  double width;
  StreamerBoxSizes({
    required this.height,
    required this.width,
  });

  late double container = height * 0.13;
  late double padding = width * 0.01;
  late double imgHW = width * 0.13;
  late double textSizedBox = width * 0.61;
  late double iconHW = width * 0.04;
  late double textAnimationHeight = container * 0.2;
}
