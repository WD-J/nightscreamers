import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SloganScreen extends StatefulWidget {
  static const String id = 'slogan_screen';

  @override
  State<StatefulWidget> createState() {
    return _SloganScreenState();
  }
}

class _SloganScreenState extends State<SloganScreen>
    with TickerProviderStateMixin {
  // 16 (17 with the period) Characters
  List<String> comeList = 'COME'.split('');
  List<String> screamList = 'SCREAM'.split('');
  List<String> withList = 'WITH'.split('');
  List<String> usList = 'US'.split('');
  String period = '.';

  // 1973 animation
  bool comeAnim = false;
  bool screamAnim = false;
  bool withAnim = false;
  bool usAnim = false;

  bool clickable = false;

  int numbersClickedOn = 0;

  Future<void> initTextAnim() async {
    // After 250 milliseconds, start animating the 1
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        comeAnim = true;
      });

      // Then animate the 9
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          screamAnim = true;
        });

        // Then animate the 7
        Future.delayed(Duration(milliseconds: 350), () {
          setState(() {
            withAnim = true;
          });

          // Then animate the 9
          Future.delayed(Duration(milliseconds: 400), () {
            setState(() {
              usAnim = true;
            });
          });
        });
      });
    });

    Future.delayed(Duration(milliseconds: 3500), () {
      clickable = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  /*
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
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WordListWidget(
                    wordList: comeList,
                    alignment: MainAxisAlignment.end,
                  ),
                  SizedBox(width: 50.0),
                  WordListWidget(
                    wordList: screamList,
                    alignment: MainAxisAlignment.end,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WordListWidget(
                    wordList: withList,
                    alignment: MainAxisAlignment.start,
                  ),
                  SizedBox(width: 50.0),
                  WordListWidget(
                    wordList: usList,
                    alignment: MainAxisAlignment.start,
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

class WordListWidget extends StatelessWidget {
  const WordListWidget({@required this.wordList, @required this.alignment});

  final List<String> wordList;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Container(
          color: Colors.red,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: wordList.length,
            itemBuilder: (context, i) {
              return Column(
                mainAxisAlignment: alignment,
                children: [
                  Padding(
                    padding:
                        i == 1 ? EdgeInsets.only(top: 0.0) : EdgeInsets.zero,
                    child: GestureDetector(
                      onTap: () {
                        // Implement onTap
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          color: Colors.green,
                          child: Text(
                            wordList[i],
                            style: TextStyle(
                              fontSize: 75.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
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
  bool animateToBlack = false;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
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
