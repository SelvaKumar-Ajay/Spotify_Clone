// import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final audioPlayer = AudioPlayer();
  final CarouselController _controller = CarouselController();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

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
  List<PaletteColor>? dycolors = [];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    addColor();
    setAudio();

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // Listen to audio duration
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    // Listen to audio position
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  Future setAudio() async {
    // Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    // Load audio from URL
    String assetPath = 'lib/musics/Vaseegara.mp3';
    audioPlayer.setSourceAsset(assetPath);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          dycolors!.isEmpty ? Colors.white : dycolors![_current].color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        title: const Text(
          'Music Player',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              dycolors!.isEmpty ? Colors.white : dycolors![_current].color,
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
                height: 300,
                // autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                // need square image
                aspectRatio: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    audioPlayer.stop();
                    // reset audio position
                    position = Duration.zero;
                  });
                },
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset('assets/audio/audio_poster/calmdown.jpg'),
            // ),
            const SizedBox(height: 20),
            const Spacer(),

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
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              thumbColor: Colors.white,
              activeColor: Colors.green,
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  formatTime(duration - position),
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
                      isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
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

  void addColor() async {
    for (String image in images) {
      final PaletteGenerator pg = await PaletteGenerator.fromImageProvider(
        AssetImage(image),
        size: const Size(200, 200),
      );
      dycolors!.add(pg.dominantColor == null
          ? PaletteColor(Colors.white, 2)
          : pg.dominantColor!);
    }
    setState(() {});
  }

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
