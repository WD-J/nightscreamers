import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PulseScreen extends StatefulWidget {
  static const String id = 'pulse_screen';

  @override
  State<StatefulWidget> createState() {
    return _PulseScreenState();
  }
}

class _PulseScreenState extends State<PulseScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationTween;

  late AnimationController _opacityAnimationController;
  late Animation<double> _opacityAnimationTween;

  @override
  void initState() {
    super.initState();

    timeDilation = timeDilation + 2.5;

    // White Shadow Animation
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _animationTween = Tween(begin: 50.0, end: 0.0).animate(CurvedAnimation(
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
                  color: Colors.red,
                ),
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: -_animationTween.value,
                  blurRadius: 100.0,
                ),
              ],
            ),
          ),
          Center(
            child: Opacity(
              opacity: _opacityAnimationTween.value,
              child: FittedBox(
                child: Text(
                  "nightscreamers",
                  style: TextStyle(
                    fontFamily: 'Nightscreamers',
                    fontSize: 200,
                    color: Colors.white,
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
