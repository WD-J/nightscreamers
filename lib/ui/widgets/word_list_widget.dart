import 'dart:math';

import 'package:animated_rotation/animated_rotation.dart';
import 'package:flutter/material.dart' hide AnimatedRotation;

class WordListWidget extends StatefulWidget {
  const WordListWidget({
    required this.wordList,
    required this.switchClicked,
  });

  final List<String> wordList;
  final void Function() switchClicked;

  @override
  _WordListWidgetState createState() => _WordListWidgetState();
}

class _WordListWidgetState extends State<WordListWidget> {
  final List<int> animList = [];

  late List<double> textSizes = [];
  void setTextSize({required double textSize}) {
    textSizes = [for (var i = 0; i != widget.wordList.length; ++i) textSize];
  }

  late List<Color> textColors = [];
  void setTextColor({required Color textColor}) {
    textColors = [for (var i = 0; i != widget.wordList.length; ++i) textColor];
  }

  Future<void> startFallAnimation(int firstInt) async {
    setState(() {
      animateTextColor(textInt: firstInt);
      animList.add(firstInt);
    });
    await Future.delayed(Duration(milliseconds: 100));
    for (var i = 0; animList.length != widget.wordList.length; i++) {
      late int rng;
      do {
        rng = Random().nextInt(widget.wordList.length);
      } while (animList.contains(rng));
      setState(() => animList.add(rng));
      await Future.delayed(Duration(milliseconds: 75));
    }
  }

  late bool hovering;
  Duration sizeAnimationDuration = Duration(milliseconds: 100);
  Curve sizeAnimationCurve = Curves.easeIn;

  Future<void> animateTextColor({required int textInt}) async {
    sizeAnimationDuration = Duration(milliseconds: 100);
    setState(() => textColors[textInt] = Colors.red);
    await Future.delayed(Duration(milliseconds: 100));
    sizeAnimationDuration = Duration(seconds: 2);
    setState(() => textColors[textInt] = Colors.white);
  }

  Future<void> startSizeAnimation() async {
    // when using, do this inside, or outside of the function:
    // wait for hover animation to complete
    // await Future.delayed(sizeAnimationDuration);
    sizeAnimationDuration = Duration(milliseconds: 3000);
    sizeAnimationCurve = Curves.linear;
    setTextSize(textSize: 10.0);
  }

  @override
  void initState() {
    super.initState();
    setTextSize(textSize: 35.0);
    setTextColor(textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.wordList.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  AnimatedPadding(
                    duration: Duration(milliseconds: 2750),
                    curve: Curves.easeIn,
                    padding: EdgeInsets.only(
                      top: animList.contains(i)
                          ? MediaQuery.of(context).size.height / 1.5
                          : 0.0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        hovering = false;
                        widget.switchClicked();
                        startFallAnimation(i);
                      },
                      onHover: (h) {
                        hovering = h;
                        setState(() {
                          hovering
                              ? textSizes[i] = textSizes[i] + 10.0
                              : textSizes[i] = textSizes[i] - 10.0;
                        });
                      },
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: AnimatedRotation(
                          duration: Duration(seconds: 2),
                          curve: Curves.easeIn,
                          angle: animList.contains(i)
                              ? Random().nextInt(50 + 50) - 50
                              : 0,
                          child: AnimatedDefaultTextStyle(
                            duration: sizeAnimationDuration,
                            curve: sizeAnimationCurve,
                            child: Text(
                              widget.wordList[i],
                            ),
                            style: TextStyle(
                              fontSize: textSizes[i],
                              color: textColors[i],
                              fontFamily: 'Nightscreamers',
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
      ],
    );
  }
}
