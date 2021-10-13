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

  Future<void> startAnimation(int firstInt) async {
    setState(() => animList.add(firstInt));
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
                      onTap: () {
                        widget.switchClicked();
                        startAnimation(i);
                      },
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: AnimatedRotation(
                          duration: Duration(seconds: 2),
                          curve: Curves.easeIn,
                          angle: animList.contains(i)
                              ? Random().nextInt(50 + 50) - 50
                              : 0,
                          child: Text(
                            widget.wordList[i],
                            style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.white,
                              // TODO: Change to 'Nightscreamers'
                              fontFamily: 'nightscreamers',
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
