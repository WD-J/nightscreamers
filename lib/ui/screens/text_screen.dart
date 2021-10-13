import 'package:flutter/material.dart';
import 'package:nightscreamers/ui/screens/video_screen.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> with TickerProviderStateMixin {
  bool animateToBlack = false;

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
