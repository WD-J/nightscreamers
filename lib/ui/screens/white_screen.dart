import 'package:flutter/material.dart';

class WhiteScreen extends StatefulWidget {
  WhiteScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WhiteScreenState createState() => _WhiteScreenState();
}

class _WhiteScreenState extends State<WhiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 100.0,
            top: 100.0,
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              width: 5,
              height: 5,
              // width: 5,
              // height: 5,
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
