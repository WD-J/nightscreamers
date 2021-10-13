import 'package:flutter/material.dart';
import 'package:nightscreamers/ui/screens/pulse_screen.dart';
import 'package:nightscreamers/ui/screens/slogan_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SloganScreen.id:
        return MaterialPageRoute(
          builder: (_) => SloganScreen(),
        );
      case PulseScreen.id:
        return MaterialPageRoute(
          builder: (_) => PulseScreen(),
        );
    }
  }
}
