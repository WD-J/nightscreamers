import 'package:auto_size_text/auto_size_text.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "";

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationTween;

  AnimationController _opacityAnimationController;
  Animation<double> _opacityAnimationTween;

  bool videoActivated = false;

  VideoPlayerController _entryVideo;
  ChewieController _chewieController;

  Future<void> initializeVideoPlayer() async {
    // TODO: Replace with VideoPlayerController.asset if necessary / efficient
    _entryVideo = VideoPlayerController.network(
        'https://dw.convertfiles.com/files/0519485001611875423/nightscreamers.264');

    await _entryVideo.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _entryVideo,
      autoPlay: false,
      looping: true,
      showControls: false,
      startAt: Duration(milliseconds: 2200),
    );

    _chewieController.setVolume(0.5);
  }

  @override
  void initState() {
    super.initState();

    initializeVideoPlayer();

    timeDilation = timeDilation + 2.5;

    // White Shadow Animation
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _animationTween = Tween(begin: 0.0, end: -75.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutQuint));

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);

    // nightscreamers Text Animation
    _opacityAnimationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _opacityAnimationController.addListener(() => setState(() {}));
    _opacityAnimationTween = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _opacityAnimationController, curve: Curves.easeInOutQuint));
    _opacityAnimationController.addListener(() {
      setState(() {});
    });
    _opacityAnimationController.forward();
    // _opacityAnimationController.repeat(reverse: true, max: 1);
  }

  @override
  void dispose() {
    _entryVideo.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: !videoActivated
          ? Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[900],
                      ),
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: -_animationTween.value,
                        blurRadius: 100.0,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Expanded(child: Container()),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Opacity(
                            opacity: _opacityAnimationTween.value,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  videoActivated = true;
                                  _chewieController.play();
                                });
                              },
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: AutoSizeText(
                                "nightscreamers",
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nightscreamers',
                                  fontSize: 275,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            )
          : Center(
              child: _chewieController != null &&
                      _chewieController.videoPlayerController.value.initialized
                  ? Chewie(
                      controller: _chewieController,
                    )
                  : Container(
                      child: Text(
                        "LOADING",
                        style: TextStyle(
                            color: Colors.white.withAlpha(
                                _opacityAnimationTween.value.toInt())),
                      ),
                    ),
            ),
    );
  }
}
