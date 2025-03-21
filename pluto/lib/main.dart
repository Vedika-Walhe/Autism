import 'package:flutter/material.dart';
import 'package:pluto/pages/LoginScreen.dart';
import 'package:pluto/pages/SignUpScreen.dart';
import 'package:pluto/pages/profile_setup_page.dart';
import 'package:pluto/pages/profile_setup_therapist.dart';
import 'package:pluto/pages/therapy_logs.dart';
import 'package:pluto/pages/parent_schedule.dart';
import 'package:pluto/pages/therapist_home_page.dart';
import 'package:pluto/pages/therapist_schedule.dart';
import 'package:pluto/pages/GetStarted.dart';
import 'package:pluto/pages/WelcomeScreen.dart';
import 'package:pluto/pages/HealthMetrics.dart';
import 'package:pluto/pages/health_dashboard.dart';
import 'package:pluto/pages/bodytemperature.dart';
import 'package:pluto/pages/heartrate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pluto',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/health_metrics': (context) => const HealthMetrics(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/profile_setup': (context) => ProfileSetupPage(),
        '/profile_setup_therapist': (context) => ProfileSetupTherapist(),
        '/therapy_logs': (context) => TherapyLogs(),
        '/parent_schedule': (context) => ParentSchedule(),
        '/therapist_home_page': (context) => TherapistHomePage(),
        '/therapist_schedule': (context) => TherapistSchedule(),
        '/health_dashboard': (context) => HealthDashboard(),
        '/GetStarted': (context) => GetStartedScreen(),
        '/bodytemperature': (context) => const BodyTemperatureScreen(),
        '/heartrate': (context) => const HeartRateScreen(),
      },
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:pluto/pages/bodytemperature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BodyTemperatureScreen(),
    );
  }
}*/