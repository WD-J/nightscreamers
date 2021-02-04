import 'package:flutter/material.dart';
import 'package:nightscreamers/screens/pulse_screen.dart';
import 'package:nightscreamers/screens/slogan_screen.dart';
// import 'package:nightscreamers/screens/home_screen_pulse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'NightScreamers',
      initialRoute: SloganScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        SloganScreen.id: (context) => SloganScreen(),
        PulseScreen.id: (context) => PulseScreen(),
      },
    );
  }
}
