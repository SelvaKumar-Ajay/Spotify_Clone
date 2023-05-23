import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:spotify/view/song_screen.dart';
// import 'package:audioplayers_web/audioplayers_web.dart';
import '../constants/constants.dart';

class StreamerBox extends StatefulWidget {
  final String title;
  final String artist;
  final String image;
  final Color boxColor;
  final String audioPath;

  const StreamerBox({
    Key? key,
    required this.title,
    required this.artist,
    required this.image,
    required this.boxColor,
    required this.audioPath,
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
    _audioPlayer.open(Audio(widget.audioPath));
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
    // debugPrint("Streamer Box");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // final currentAudio = _audioPlayer.current;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AudioPlayerScreen(),
          ),
        );
      },
      child: Column(children: [
        //Streamer box
        Container(
          color: widget.boxColor,
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
                    widget.image,
                    height:
                        StreamerBoxSizes(height: height, width: width).imgHW,
                    width: StreamerBoxSizes(height: height, width: width).imgHW,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: StreamerBoxSizes(height: height, width: width)
                      .textSizedBox,
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
                        widget.artist,
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
                    width:
                        StreamerBoxSizes(height: height, width: width).iconHW,
                    height:
                        StreamerBoxSizes(height: height, width: width).iconHW,
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
                    inactiveColor: widget.boxColor.withOpacity(0.8),
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _sliderValue,
                    onChanged: _onSliderChanged),
              ),
            ),
            // Text('${_duration.inSeconds}'),
          ],
        )
      ]),
    );
  }
}
