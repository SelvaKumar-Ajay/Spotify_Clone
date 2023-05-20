import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers_web/audioplayers_web.dart';
import '../constants/constants.dart';

class StreamerBox extends StatefulWidget {
  final String title;
  const StreamerBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<StreamerBox> createState() => _StreamerBoxState();
}

class _StreamerBoxState extends State<StreamerBox> {
  Duration _duration = Duration.zero;
  bool _isPlaying = false;
  bool _isPaused = false;
  double _sliderValue = 0.0;
  AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  final audioPath1 = "lib/musics/Vaseegara.mp3";
  final audioPath2 = "lib/musics/PathuThala.mp3";
  final audioPath3 = "lib/musics/Arabu-Naade.mp3";

  // AudioPlayer player = AudioPlayer();
  // Duration _duration = Duration(seconds: 90);

  @override
  void initState() {
    super.initState();
    _audioPlayer = AssetsAudioPlayer();
    _audioPlayer.current.listen((value) {
      setState(() {
        _sliderValue = value!.audio.duration.inSeconds.toDouble();
        _duration = value.audio.duration;
      });
    });
  }

  void openAudio() {
    _audioPlayer.open(Audio(audioPath1));
  }

  void togglePlayer() {
    if (_isPlaying) {
      _audioPlayer.play();
      setState(() {
        _isPaused = true;
        _isPlaying = false;
      });
    } else if (_isPaused) {
      _audioPlayer.pause();
      setState(() {
        _isPaused = false;
        _isPlaying = true;
      });
    } else {
      openAudio();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
      _audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("Streamer Box");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // final currentAudio = _audioPlayer.current;

    return Column(children: [
      //Streamer box
      Container(
        color: redColor,
        height: StreamerBoxSizes(height: height, width: width).container,
        child: Padding(
          padding: EdgeInsets.all(
              StreamerBoxSizes(height: height, width: width).padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtaWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  height: StreamerBoxSizes(height: height, width: width).imgHW,
                  width: StreamerBoxSizes(height: height, width: width).imgHW,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width:
                    StreamerBoxSizes(height: height, width: width).textSizedBox,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: StreamerBoxSizes(height: height, width: width)
                          .textAnimationHeight,
                      child: widget.title.length > 30
                          ? Marquee(
                              text: widget.title,
                              blankSpace: 10.0,
                              velocity: 60.0,
                              pauseAfterRound: const Duration(seconds: 2),
                              startPadding: 5.0,

                              // fadingEdgeStartFraction: 5.0,
                              // fadingEdgeEndFraction: 5.0,
                              accelerationCurve: Curves.easeInOut,
                              decelerationCurve: Curves.easeInOut,
                              // accelerationDuration: const Duration(seconds: 1),
                              // accelerationCurve: Curves.linear,
                              // decelerationDuration: const Duration(milliseconds: 500),
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 13.0,
                              ),
                            )
                          : Text(
                              widget.title,
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 13.0,
                              ),
                            ),
                    ),
                    Text(
                      "desc of Song",
                      style: TextStyle(
                        color: whiteColor.withOpacity(0.5),
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  IconConstants.likeIcon,
                  width: StreamerBoxSizes(height: height, width: width).iconHW,
                  height: StreamerBoxSizes(height: height, width: width).iconHW,
                  color: whiteColor,
                ),
              ),
              IconButton(
                  onPressed: togglePlayer,
                  icon: _isPaused
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
            ],
          ),
        ),
      ),
      //Slider
      Row(
        children: [
          // Text('${position.inSeconds}'),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 0.0,
                ),
                thumbColor: transparentColor,
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 0.0,
                ),
              ),
              child: Slider(
                  activeColor: whiteColor,
                  inactiveColor: greyColor,
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  value: _sliderValue,
                  onChanged: _onSliderChanged),
            ),
          ),
          // Text('${_duration.inSeconds}'),
        ],
      )
    ]);
  }
}
