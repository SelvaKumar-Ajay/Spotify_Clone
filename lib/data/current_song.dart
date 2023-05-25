import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:spotify/constants/colors.dart';

class CurrentSong {
  final String img;
  final String title;
  final String artist;
  final String audioPath;
  double duration;
  bool isPlaying;
  bool openAudio;
  // bool isPaused;
  final Color color;
  double sliderValue;
  final Icon play = const Icon(Icons.play_arrow);
  final Icon pause = const Icon(Icons.pause);
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  CurrentSong(
    this.img,
    this.title,
    this.artist,
    this.audioPath,
    this.isPlaying,
    this.openAudio,
    // this.isPaused,
    this.color,
    this.sliderValue,
    this.duration,
    //  this.IconData,
  );
}

class CurrentSongData with ChangeNotifier {
  CurrentSong data = CurrentSong(
    "lib/images/calmdown1.jpg",
    'Calm Down',
    'Rema, Selena Gomez',
    "lib/musics/Vaseegara.mp3",
    false,
    true,
    // false,
    brownColor,
    0,
    0,
  );

  void notify() {
    notifyListeners();
  }
}
