import 'package:flutter/material.dart';
import 'package:nightscreamers/ui/screens/pulse_screen.dart';
import 'package:nightscreamers/ui/screens/slogan_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SloganScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SloganScreen(),
        );
      case PulseScreen.id:
        return PageRouteBuilder(
          settings: settings,
          // TODO: can I use builder here? or do I need to use pageBuilder because of the animation?
          pageBuilder: (_, __, ___) => PulseScreen(),
          transitionDuration: Duration.zero,
        );
    }
  }
}
