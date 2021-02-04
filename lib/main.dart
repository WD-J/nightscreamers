import 'package:flutter/material.dart';
import 'package:nightscreamers/screens/home_screen_numbers_anim.dart';
// import 'package:nightscreamers/screens/home_screen_pulse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'NightScreamers',
      initialRoute: HomeScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
