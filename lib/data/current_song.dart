import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:spotify/constants/colors.dart';

class CurrentSong {
  String img;
  String title;
  String artist;
  String audioPath;
  double duration;
  bool isPlaying;
  bool openAudio;
  // bool isPaused;
  Color color;
  double sliderValue;
  Icon icon;
  int songIndex;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  CurrentSong(
      this.img,
      this.title,
      this.artist,
      this.audioPath,
      this.isPlaying,
      this.openAudio,
      this.color,
      this.sliderValue,
      this.duration,
      this.icon,
      this.songIndex);
}

class CurrentSongData with ChangeNotifier {
  CurrentSong data = CurrentSong(
    'lib/images/arabu_naade.jpeg',
    'Arabu Naade',
    'Yuvan Shankar Raja',
    'lib/musics/Arabu-Naade.mp3',
    false,
    true,
    greyColor,
    0,
    0,
    const Icon(Icons.play_arrow),
    0,
  );

  void notify() {
    notifyListeners();
  }

  int page = 0;
  void tabNotify(int index) {
    page = index;
    notifyListeners();
  }
}
