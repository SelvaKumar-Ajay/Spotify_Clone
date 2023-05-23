// import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
// import 'package:palette_generator/palette_generator.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  Duration _duration = Duration.zero;
  bool _isPlaying = false;
  bool _isPaused = false;
  double _sliderValue = 0.0;
  AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  final List<String> images = [
    'lib/images/calmdown1.jpg',
    'lib/images/Divide.jpeg',
    'lib/images/Equals.png',
    'lib/images/Know.jpg',
    'lib/images/perfect.jpg',
    'lib/images/starboy.jpg',
    'lib/images/subract.png',
    'lib/images/X.png',
  ];
  final List<String> imagesNames = [
    'Calm Down',
    'Divide',
    'Equals',
    'Know',
    'Perfect',
    'Starboy',
    'Subract',
    'X',
  ];
  final List<String> imagesArtistNames = [
    'Rema, Selena Gomez',
    'Ed Sheeran',
    'Ed Sheeran',
    'The Chainsmokers',
    'Ed Sheeran',
    'The Weeknd',
    'Ed Sheeran',
    'Ed Sheeran',
  ];
  List<Color> dycolors = [
    brownColor,
    blueColor,
    redColor,
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
    _audioPlayer = AssetsAudioPlayer();

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
    _audioPlayer.open(Audio("lib/musics/Vaseegara.mp3"));
  }

  void togglePlayer() {
    if (_isPlaying) {
      _audioPlayer.play();
      setState(() {
        _isPaused = !_isPaused;
        _isPlaying = !_isPlaying;
      });
    } else if (_isPaused) {
      _audioPlayer.pause();
      setState(() {
        _isPaused = !_isPaused;
        _isPlaying = !_isPlaying;
      });
    } else {
      openAudio();
      setState(() {
        _isPaused = !_isPaused;
      });
    }
  }

  void _onSliderChanged(double value) {
    _audioPlayer.seek(Duration(seconds: value.toInt()));
    setState(() {
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
    return Scaffold(
      backgroundColor: dycolors.isEmpty ? Colors.white : dycolors[_current],
      // transparentColor,
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
        padding: const EdgeInsets.all(20),
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
            CarouselSlider(
              items: images
                  .map(
                    (item) => Container(
                      //  height: height * 0.5,
                      // width: width,
                      height: 400,
                      width: 300,
                      margin: const EdgeInsets.all(5.0),
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
                // height: height * 0.5,
                height: 300,
                // autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                // need square image
                aspectRatio: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    _audioPlayer.stop();
                    // reset audio position
                    _sliderValue = 0.0;
                  });
                },
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset('assets/audio/audio_poster/calmdown.jpg'),
            // ),
            SizedBox(height: height * 0.1),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imagesNames[_current],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      imagesArtistNames[_current],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite,
                  size: 30,
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  formatTime(
                      _duration - Duration(seconds: _sliderValue.toInt())),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.shuffle,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.skip_previous_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      _isPaused
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    onPressed: togglePlayer,
                  ),
                ),
                const Icon(
                  Icons.skip_next_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.repeat,
                  size: 30,
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
