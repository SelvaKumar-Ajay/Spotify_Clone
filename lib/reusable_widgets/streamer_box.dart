import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:spotify/data/current_song.dart';
import 'package:spotify/view/song_screen.dart';
// import 'package:audioplayers_web/audioplayers_web.dart';
import '../constants/constants.dart';

class StreamerBox extends StatefulWidget {
  final String title;
  final String artist;
  final String image;
  final Color boxColor;
  final String audioPath;
  final AssetsAudioPlayer audioPlayer;
  final bool isPlaying;
  final bool openAudio;
  final CurrentSongData currentSongData;

  const StreamerBox({
    Key? key,
    required this.title,
    required this.artist,
    required this.image,
    required this.boxColor,
    required this.audioPath,
    required this.audioPlayer,
    required this.isPlaying,
    required this.openAudio,
    required this.currentSongData,
  }) : super(key: key);

  @override
  State<StreamerBox> createState() => _StreamerBoxState();
}

class _StreamerBoxState extends State<StreamerBox> {
  Duration _duration = Duration.zero;
  late bool _isPlaying;
  late bool _openAudio;
  double _sliderValue = 0.0;
  late AssetsAudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // var currentSongData = Provider.of<CurrentSongData>(context, listen: true);
    // _audioPlayer = currentSongData.data.audioPlayer;
    // _isPlaying = currentSongData.data.isPlaying;
    // _openAudio = currentSongData.data.openAudio;
    _audioPlayer = widget.audioPlayer;
    _isPlaying = widget.isPlaying;
    _openAudio = widget.openAudio;
    _audioPlayer.currentPosition.listen((event) {
      setState(() {
        _sliderValue = event.inSeconds.toDouble();
        // widget.currentSongData.data.sliderValue = _sliderValue;
      });
      // debugPrint('cp $_sliderValue');
    });
    _audioPlayer.current.listen((value) {
      setState(() {
        // _sliderValue = value!.audio.duration.inSeconds.toDouble();
        // debugPrint('$_sliderValue');
        _duration = value!.audio.duration;
        // widget.currentSongData.data.duration = _duration.inSeconds.toDouble();

        // debugPrint('$_duration');
      });
    });
  }

  // void notify(BuildContext context) {
  //   Provider.of<CurrentSongData>(context, listen: false).notify();
  // }

  void openAudio() {
    _audioPlayer.open(Audio(widget.audioPath));
  }

  void togglePlayer() {
    // var currentSongData = Provider.of<CurrentSongData>(context, listen: true);
    if (_openAudio) {
      _openAudio = !_openAudio;
      widget.currentSongData.data.openAudio = _openAudio;
      openAudio();

      setState(() {
        _isPlaying = !_isPlaying;
        widget.currentSongData.data.isPlaying = _isPlaying;
        // debugPrint(widget.currentSongData.data.isPlaying.toString());
      });
    } else if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        // _isPaused = !_isPaused;
        _isPlaying = !_isPlaying;
        widget.currentSongData.data.isPlaying = _isPlaying;
        // debugPrint(widget.currentSongData.data.isPlaying.toString());
      });
    } else {
      _audioPlayer.play();
      setState(() {
        // _isPaused = !_isPaused;
        _isPlaying = !_isPlaying;
        widget.currentSongData.data.isPlaying = _isPlaying;
        // debugPrint(widget.currentSongData.data.isPlaying.toString());
      });
    }
    // notify(context);
    //else {
    //   openAudio();
    //   setState(() {
    //     _isPaused = !_isPaused;
    //     widget.currentSongData.data.isPaused = _isPaused;
    //     // widget.currentSongData.data.isPlaying = _isPlaying;
    //   });
    // }
  }

  void _onSliderChanged(double value) {
    _audioPlayer.seek(Duration(seconds: value.toInt()));
    setState(() {
      _sliderValue = value;
      // widget.currentSongData.data.sliderValue = _sliderValue;
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
    var currentSongData = Provider.of<CurrentSongData>(context, listen: true);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AudioPlayerScreen(
              audioPlayer: currentSongData.data.audioPlayer,
            ),
          ),
        );
      },
      child: Column(children: [
        //Streamer box
        Container(
          color: currentSongData.data.color,
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
                  child: Image.asset(
                    currentSongData.data.img,
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
                        child: currentSongData.data.title.length > 30
                            ? Marquee(
                                text: currentSongData.data.title,
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
                                currentSongData.data.title,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 13.0,
                                ),
                              ),
                      ),
                      Text(
                        currentSongData.data.artist,
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
                    icon: _isPlaying
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
