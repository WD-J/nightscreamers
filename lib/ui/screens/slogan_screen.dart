import 'package:flutter/material.dart';
import 'package:nightscreamers/ui/screens/pulse_screen.dart';
import 'package:nightscreamers/ui/widgets/word_list_widget.dart';

class SloganScreen extends StatefulWidget {
  static const String id = '/';

  @override
  State<StatefulWidget> createState() {
    return _SloganScreenState();
  }
}

class _SloganScreenState extends State<SloganScreen>
    with TickerProviderStateMixin {
  List<String> comeList = 'COME'.split('');
  List<String> screamList = 'SCREAM'.split('');
  List<String> withList = 'WITH'.split('');
  List<String> usList = 'US'.split('');

  bool comeClicked = false;
  bool screamClicked = false;
  bool withClicked = false;
  bool usClicked = false;

  bool replacePeriod = false;
  bool periodClickable = false;
  bool periodExpanded = false;

  GlobalKey _periodKey = GlobalKey();
  late double periodX;
  late double periodY;

  _setPeriodPosition() {
    RenderBox box = _periodKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    periodX = position.dx;
    periodY = position.dy;
  }

  Future<void> checkAllClicked() async {
    if (comeClicked && screamClicked && withClicked && usClicked) {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        backgroundColor = Colors.white;
        periodColor = Colors.black;
      });
      await Future.delayed(Duration(seconds: 1));
      _setPeriodPosition();
      setState(() {
        replacePeriod = true;
        periodClickable = true;
      });
    }
  }

  Future<void> expandPeriod() async {
    setState(() {
      periodExpanded = true;
      periodClickable = false;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, PulseScreen.id);
  }

  Color backgroundColor = Colors.black;
  Color periodColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: periodClickable ? expandPeriod : null,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
          color: backgroundColor,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.25,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AbsorbPointer(
                          absorbing: comeClicked,
                          child: WordListWidget(
                              wordList: comeList,
                              switchClicked: () {
                                setState(() => comeClicked = true);
                                checkAllClicked();
                              }),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        AbsorbPointer(
                          absorbing: screamClicked,
                          child: WordListWidget(
                            wordList: screamList,
                            switchClicked: () {
                              setState(() => screamClicked = true);
                              checkAllClicked();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.25,
                  ),
                  SizedBox(height: 50.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AbsorbPointer(
                          absorbing: withClicked,
                          child: WordListWidget(
                            wordList: withList,
                            switchClicked: () {
                              setState(() => withClicked = true);
                              checkAllClicked();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        AbsorbPointer(
                          absorbing: usClicked,
                          child: WordListWidget(
                            wordList: usList,
                            switchClicked: () {
                              setState(() => usClicked = true);
                              checkAllClicked();
                            },
                          ),
                        ),
                        // if (!allClicked)
                        if (!replacePeriod)
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 23.5, left: 5.0),
                            child: Container(
                              key: _periodKey,
                              width: 6.0,
                              height: 6.0,
                              decoration: BoxDecoration(
                                color: periodColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (replacePeriod) buildPeriod(context),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildPeriod(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      key: _periodKey,
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastLinearToSlowEaseIn,
      width: periodExpanded ? screenWidth : 6.0,
      height: !periodExpanded ? 6.0 : screenHeight,
      transform: Matrix4.translationValues(
        !periodExpanded ? periodX : 0,
        !periodExpanded ? periodY : 0,
        0.0,
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: periodColor,
          borderRadius: BorderRadius.circular(
            !periodExpanded ? 25.0 : 0.0,
          ),
        ),
        child: InkWell(
          onTap: !periodClickable ? null : expandPeriod,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}
