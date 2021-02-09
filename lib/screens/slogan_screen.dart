import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
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
  GlobalKey _keyPeriod = GlobalKey();

  Size _getSizes() {
    final RenderBox renderBoxPeriod =
        _keyPeriod.currentContext.findRenderObject();
    final sizePeriod = renderBoxPeriod.size;
    print("SIZE of period: $sizePeriod");
    // flutter: SIZE of period: Size(375.0, 152.9) (x, y)
    return sizePeriod;
  }

  Offset _getPositions() {
    final RenderBox renderBoxPeriod =
        _keyPeriod.currentContext.findRenderObject();
    final positionPeriod = renderBoxPeriod.localToGlobal(Offset.zero);
    print("POSITION of period: $positionPeriod");
    // flutter: POSITION of period: Offset(0.0, 76.0) (x, y)
    return positionPeriod;
  }

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

  // TODO: Have you disposed everything?

  bool toWhite = false;
  Future<void> transitionToWhite() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            WhiteScreen(sizePeriod: sizePeriod, positionPeriod: positionPeriod),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  Size sizePeriod;
  Offset positionPeriod;

  _afterLayout(_) {
    sizePeriod = _getSizes();
    positionPeriod = _getPositions();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    transitionToWhite();
    super.initState();
  }

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
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  WordListWidget(
                    wordList: screamList,
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // CrossAxisAlignment is at start for the AnimatedContainer
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WordListWidget(
                    wordList: withList,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  WordListWidget(
                    wordList: usList,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Text(
                      period,
                      key: _keyPeriod,
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontFamily: 'nightscreamers',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
  const WordListWidget({
    @required this.wordList,
    @required this.mainAxisAlignment,
  });

  final List<String> wordList;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: wordList.length,
            itemBuilder: (context, i) {
              return Column(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: i == 1 ? 0.0 : 0.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Implement onTap
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Text(
                          wordList[i],
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            fontFamily: 'nightscreamers',
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
      ],
    );
  }
}

class WhiteScreen extends StatefulWidget {
  WhiteScreen({
    Key key,
    @required this.sizePeriod,
    @required this.positionPeriod,
  }) : super(key: key);
  final Size sizePeriod;
  final Offset positionPeriod;

  @override
  _WhiteScreenState createState() =>
      _WhiteScreenState(sizePeriod: sizePeriod, positionPeriod: positionPeriod);
}

class _WhiteScreenState extends State<WhiteScreen> {
  _WhiteScreenState({
    @required this.sizePeriod,
    @required this.positionPeriod,
  });

  final Size sizePeriod;
  final Offset positionPeriod;

  // TODO: GET THE POSITION, PASS IT ON AFTER THE ANIMATION.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: positionPeriod.dx + (sizePeriod.width / 100 * 20),
            top: positionPeriod.dy + (sizePeriod.height / 100 * 70),
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
            ),
          ),
        ],
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
