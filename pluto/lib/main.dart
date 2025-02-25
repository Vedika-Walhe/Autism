import 'package:flutter/material.dart';
import 'package:pluto/pages/HealthMetrics.dart';
import 'package:pluto/pages/WelcomeScreen.dart';
import 'pages/GetStarted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pluto',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // Start with the GetStartedScreen
      routes: {
        '/': (context) => GetStartedScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/healthMetrics': (context) => HealthMetrics(),
      },
    );
  }
}