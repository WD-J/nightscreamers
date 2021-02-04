import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../responsive.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "";

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // 1973 animation
  bool oneAnim = false;
  bool nineAnim = false;
  bool sevenAnim = false;
  bool threeAnim = false;

  bool clickable = false;

  int numbersClickedOn = 0;

  Future<void> initNumbersAnim() {
    // After 250 milliseconds, start animating the 1
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        oneAnim = true;
      });

      // Then animate the 9
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          nineAnim = true;
        });

        // Then animate the 7
        Future.delayed(Duration(milliseconds: 350), () {
          setState(() {
            sevenAnim = true;
          });

          // Then animate the 9
          Future.delayed(Duration(milliseconds: 400), () {
            setState(() {
              threeAnim = true;
            });
          });
        });
      });
    });

    Future.delayed(Duration(milliseconds: 3500), () {
      clickable = true;
    });
  }

  void transitionFunction() {
    numbersClickedOn++;

    if (numbersClickedOn == 4) {
      Future.delayed(Duration(milliseconds: 2500), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => TextScreen(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    initNumbersAnim();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
        color: Colors.white,
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 0.0 : 150.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: oneAnim
                              ? Curves.fastLinearToSlowEaseIn
                              : Curves.easeInCubic,
                          padding: EdgeInsets.only(
                            top: oneAnim
                                ? 0.0
                                : MediaQuery.of(context).size.height,
                          ),
                          child: InkWell(
                            onTap: () {
                              clickable == true
                                  ? oneAnim == true
                                      ? setState(() {
                                          oneAnim = false;
                                          transitionFunction();
                                        })
                                      : null
                                  : null;
                            },
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 250,
                                fontFamily: 'Nightscreamers',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: sevenAnim
                              ? Curves.fastLinearToSlowEaseIn
                              : Curves.easeInCubic,
                          padding: EdgeInsets.only(
                            top: sevenAnim
                                ? 0.0
                                : MediaQuery.of(context).size.height,
                          ),
                          child: InkWell(
                            onTap: () {
                              clickable == true
                                  ? sevenAnim == true
                                      ? setState(() {
                                          sevenAnim = false;
                                          transitionFunction();
                                        })
                                      : null
                                  : null;
                            },
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              '7',
                              style: TextStyle(
                                fontSize: 250,
                                fontFamily: 'Nightscreamers',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: nineAnim
                              ? Curves.fastLinearToSlowEaseIn
                              : Curves.easeInCubic,
                          padding: EdgeInsets.only(
                            top: nineAnim
                                ? 0.0
                                : MediaQuery.of(context).size.height,
                          ),
                          child: InkWell(
                            onTap: () {
                              clickable == true
                                  ? nineAnim == true
                                      ? setState(() {
                                          nineAnim = false;
                                          transitionFunction();
                                        })
                                      : null
                                  : null;
                            },
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              '9',
                              style: TextStyle(
                                fontSize: 250,
                                fontFamily: 'Nightscreamers',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: threeAnim
                              ? Curves.fastLinearToSlowEaseIn
                              : Curves.easeInCubic,
                          padding: EdgeInsets.only(
                            top: threeAnim
                                ? 0.0
                                : MediaQuery.of(context).size.height,
                          ),
                          child: InkWell(
                            onTap: () {
                              clickable == true
                                  ? threeAnim == true
                                      ? setState(() {
                                          threeAnim = false;
                                          transitionFunction();
                                        })
                                      : null
                                  : null;
                            },
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontSize: 250,
                                fontFamily: 'Nightscreamers',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> with TickerProviderStateMixin {
  AnimationController _shadowAnimController;
  Animation<double> _shadowAnimTween;

  AnimationController _textAnimController;
  Animation<double> _textAnimTween;

  bool isAnimating = false;
  bool animateToBlack = false;

  List<String> nightScreamersList = [
    'N',
    'I',
    'G',
    'H',
    'T',
    'S',
    'C',
    'R',
    'E',
    'A',
    'M',
    'E',
    'R',
    'S',
    '.',
  ];

  VideoPlayerController _entryVideo;
  ChewieController _chewieController;

  Future<void> initializeVideoPlayer() async {
    // TODO: Replace with VideoPlayerController.asset if necessary / efficient
    _entryVideo = VideoPlayerController.network(
        'https://nightscreamers.com/wp-content/uploads/2020/08/Nightscreamers.mp4');

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
    initializeVideoPlayer();

    // White Shadow Animation
    _shadowAnimController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _shadowAnimTween = Tween(begin: -75.0, end: 0.0).animate(CurvedAnimation(
        parent: _shadowAnimController, curve: Curves.easeInOutQuint));
    _shadowAnimController.addListener(() => setState(() {}));

    // Text Animation
    _textAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );
    _textAnimTween =
        Tween<double>(begin: 0.0, end: 14.0).animate(_textAnimController);
    _textAnimController.addListener(() => setState(() {}));

    // Initial animation start
    Future.delayed(Duration(milliseconds: 500), () {
      _shadowAnimController.forward().then((value) {
        _shadowAnimController.reverse();
      });

      Future.delayed(Duration(milliseconds: 250), () {
        setState(() {
          isAnimating = true;
        });
        _textAnimController.forward();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _shadowAnimController.dispose();
    _textAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: -_shadowAnimTween.value,
                  blurRadius: 100.0,
                ),
              ],
            ),
          ),
          _textAnimTween.value != 14.0
              ? Center(
                  child: Text(
                    isAnimating
                        ? nightScreamersList[_textAnimTween.value.toInt()]
                        : '',
                    style: TextStyle(
                      fontSize: 250,
                      fontFamily: 'Nightscreamers',
                      color: Colors.black,
                    ),
                  ),
                )
              : Center(
                  child: AnimatedPadding(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastLinearToSlowEaseIn,
                    padding: EdgeInsets.only(
                      top: animateToBlack ? 0.0 : 150.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          animateToBlack = true;
                        });
                        Future.delayed(Duration(milliseconds: 2100), () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  VideoScreen(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        });
                      },
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AnimatedPadding(
                        duration: Duration(seconds: 2),
                        curve: Curves.fastLinearToSlowEaseIn,
                        padding: EdgeInsets.all(
                          animateToBlack ? 0.0 : 15.0,
                        ),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: animateToBlack
                              ? MediaQuery.of(context).size.width
                              : 27.5,
                          height: animateToBlack
                              ? MediaQuery.of(context).size.height
                              : 27.5,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              animateToBlack ? 0.0 : 500.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _entryVideo;
  ChewieController _chewieController;

  Future<void> initializeVideoPlayer() async {
    // TODO: Replace with VideoPlayerController.asset if necessary / efficient
    _entryVideo = VideoPlayerController.network(
        'https://nightscreamers.com/wp-content/uploads/2020/08/Nightscreamers.mp4');

    await _entryVideo.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _entryVideo,
      autoPlay: false,
      looping: true,
      showControls: false,
      startAt: Duration(milliseconds: 0),
    );

    _chewieController.setVolume(0.5);
    setState(() {});
    _chewieController.play();
  }

  @override
  void initState() {
    initializeVideoPlayer();

    super.initState();
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
      backgroundColor: Colors.black,
      body: Center(
        child: _chewieController != null &&
                _chewieController.videoPlayerController.value.initialized
            ? Chewie(
                controller: _chewieController,
              )
            : Container(),
      ),
    );
  }
}
