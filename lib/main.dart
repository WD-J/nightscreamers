import 'package:flutter/material.dart';

import 'ui/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nightscreamers',
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
