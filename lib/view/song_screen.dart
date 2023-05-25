// import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/current_song.dart';
import 'package:spotify/view/home_screen.dart';
// import 'package:palette_generator/palette_generator.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String title;
  final String artist;
  final String image;
  final Color boxColor;
  final String audioPath;
  final AssetsAudioPlayer audioPlayer;
  final bool isPlaying;
  final bool openAudio;
  final int songindex;
  final CurrentSongData currentSongData;

  const AudioPlayerScreen(
      {Key? key,
      required this.audioPlayer,
      required this.title,
      required this.artist,
      required this.image,
      required this.boxColor,
      required this.audioPath,
      required this.isPlaying,
      required this.openAudio,
      required this.currentSongData,
      required this.songindex})
      : super(key: key);
  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  Duration _duration = Duration.zero;
  // bool _isPlaying = false;
  // bool _isPaused = false;
  late bool _isPlaying;
  late bool _openAudio;
  double _sliderValue = 0.0;
  late AssetsAudioPlayer _audioPlayer;

  final List<String> images = [
    'lib/images/arabu_naade.jpeg',
    'lib/images/vaseegara.jpeg',
    'lib/images/calmdown1.jpg',
    'lib/images/Divide.jpeg',
    // 'lib/images/Equals.png',
    'lib/images/Know.jpg',
    'lib/images/perfect.jpg',
    'lib/images/starboy.jpg',
    'lib/images/subract.png',
    'lib/images/X.png',
  ];
  List<String> imgPaths = [
    'lib/musics/Arabu-Naade.mp3',
    'lib/musics/Vaseegara.mp3',
    'lib/musics/CalmDown.mp3',
    'lib/musics/Dive.mp3',
    // 'lib/musics/Leave Your Life.mp3',
    'lib/musics/Know.mp3',
    'lib/musics/Perfect.mp3',
    'lib/musics/Starboy.mp3',
    'lib/musics/Subtract.mp3',
    'lib/musics/Dont.mp3',
  ];
  final List<String> imagesNames = [
    'Arabu Naade',
    'Vaseegara',
    'Calm Down',
    'Divide',
    // 'Equals',
    'Know',
    'Perfect',
    'Starboy',
    'Subract',
    'X',
  ];
  List<String> imagesArtistNames = [
    'Yuvan Shankar Raja',
    'Bombay Jeya Shree',
    'Rema, Selena Gomez',
    'Ed Sheeran',
    // 'Ed Sheeran',
    'The Chainsmokers',
    'Ed Sheeran',
    'The Weeknd',
    'Ed Sheeran',
    'Ed Sheeran',
  ];
  List<Color> dycolors = [
    greyColor,
    redColor,
    brownColor,
    blueColor,
    // redColor,
    greyColor,
    blueColor,
    redColor,
    yellowColor,
    Colors.green,
  ];

  // AudioPlayer player = AudioPlayer();
  // Duration _duration = Duration(seconds: 90);

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget.audioPlayer;
    _isPlaying = widget.isPlaying;
    _openAudio = widget.openAudio;
    _current = widget.songindex;
    _audioPlayer.currentPosition.listen((event) {
      setState(() {
        _sliderValue = event.inSeconds.toDouble();
      });
      // debugPrint('cp $_sliderValue');
    });
    _audioPlayer.current.listen((value) {
      setState(() {
        // _sliderValue = value!.audio.duration.inSeconds.toDouble();
        // debugPrint('$_sliderValue');
        _duration = value!.audio.duration;
        // debugPrint('$_duration');
      });
    });
  }

  void openAudio() {
    _audioPlayer.open(Audio(imgPaths[_current]));
  }

  void notify(BuildContext context) {
    Provider.of<CurrentSongData>(context, listen: false).notify();
  }

  void togglePlayer() {
    if (_openAudio) {
      _openAudio = !_openAudio;
      widget.currentSongData.data.openAudio = _openAudio;
      openAudio();
      _isPlaying = !_isPlaying;
      widget.currentSongData.data.isPlaying = _isPlaying;
      // widget.currentSongData.data.icon = const Icon(Icons.pause);

      // debugPrint(widget.currentSongData.data.isPlaying.toString());
      // debugPrint(
      //     'openAudio ${widget.currentSongData.data.openAudio.toString()}');
    } else if (_isPlaying) {
      _audioPlayer.pause();
      _isPlaying = !_isPlaying;
      widget.currentSongData.data.isPlaying = _isPlaying;
      // widget.currentSongData.data.icon = const Icon(Icons.play_arrow);
      // debugPrint('else if ${widget.currentSongData.data.isPlaying.toString()}');
    } else {
      _audioPlayer.play();
      // _isPaused = !_isPaused;
      _isPlaying = !_isPlaying;
      widget.currentSongData.data.isPlaying = _isPlaying;
      // widget.currentSongData.data.icon = const Icon(Icons.play_arrow);

      // debugPrint('else ${widget.currentSongData.data.isPlaying.toString()}');
    }
    notify(context);
    setState(() {});
  }

  void _onSliderChanged(double value) {
    setState(() {
      _audioPlayer.seek(Duration(seconds: value.toInt()));
      _sliderValue = value;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SongScreenSizes sizes = SongScreenSizes(height, width);
    return Scaffold(
      backgroundColor: dycolors.isEmpty ? Colors.white : dycolors[_current],
      // transparentColor,
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
        // const Text(
        //   ,
        // style: TextStyle(
        //   color: Colors.white,
        //   fontWeight: FontWeight.bold,
        // ),
        // ),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'PLAYING FROM PLAYLIST \n',
            children: [
              TextSpan(
                text: 'Pop Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(sizes.containerPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              dycolors.isEmpty ? Colors.grey : dycolors[_current],
              Colors.black87,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: images
                    .map(
                      (item) => SizedBox(
                        //  height: height * 0.5,
                        // width: width,
                        // height: 400,
                        width: double.infinity,
                        // margin: const EdgeInsets.all(),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  initialPage: _current,
                  height: sizes.image,
                  // height: 300,
                  // autoPlay: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  // need square image
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    widget.currentSongData.data.artist =
                        imagesArtistNames[index];
                    widget.currentSongData.data.audioPath = imgPaths[index];
                    widget.currentSongData.data.color = dycolors[index];
                    widget.currentSongData.data.img = images[index];
                    widget.currentSongData.data.title = imagesNames[index];
                    widget.currentSongData.data.openAudio = true;
                    widget.currentSongData.data.isPlaying = false;
                    widget.currentSongData.data.songIndex = index;
                    notify(context);

                    setState(() {
                      _current = index;
                      _audioPlayer.stop();
                      _openAudio = true;
                      _isPlaying = false;
                      // reset audio position
                      _sliderValue = 0.0;
                    });
                  },
                ),
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset('assets/audio/audio_poster/calmdown.jpg'),
            // ),
            SizedBox(height: sizes.spacebwImgTitle),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // widget.title,
                      imagesNames[_current],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizes.titleText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      // widget.artist,
                      imagesArtistNames[_current],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.favorite,
                  size: sizes.icon,
                  color: Colors.green,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(height * 0.02),
              child: SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 5.0,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 0.0,
                  ),
                ),
                child: Slider(
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _sliderValue,
                    thumbColor: Colors.white,
                    activeColor: whiteColor,
                    inactiveColor: greyColor.withOpacity(0.7),
                    onChanged: _onSliderChanged),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(Duration(seconds: _sliderValue.toInt())),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizes.timingValues,
                  ),
                ),
                Text(
                  formatTime(
                      _duration - Duration(seconds: _sliderValue.toInt())),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizes.timingValues,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.shuffle,
                  size: sizes.icon,
                  color: Colors.white,
                ),
                SizedBox(width: width * 0.05),
                Icon(
                  Icons.skip_previous_rounded,
                  size: sizes.icon,
                  color: Colors.white,
                ),
                CircleAvatar(
                  radius: sizes.avatarRadius,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: _isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    iconSize: sizes.playPause,
                    onPressed: togglePlayer,
                  ),
                ),
                Icon(
                  Icons.skip_next_rounded,
                  size: sizes.icon,
                  color: Colors.white,
                ),
                SizedBox(width: width * 0.05),
                Icon(
                  Icons.repeat,
                  size: sizes.icon,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void addColor() async {
  //   for (String image in images) {
  //     final PaletteGenerator pg = await PaletteGenerator.fromImageProvider(
  //       AssetImage(image),
  //       size: const Size(200, 200),
  //     );
  //     dycolors!.add(pg.dominantColor == null
  //         ? PaletteColor(Colors.white, 2)
  //         : pg.dominantColor!);
  //   }
  //   setState(() {});
  // }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inMinutes.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
