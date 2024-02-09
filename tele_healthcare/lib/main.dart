import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tele_healthcare/Screens/Doctor/d-finalDiagnosis&Appointment.dart';
import 'package:tele_healthcare/Screens/Nurse/n-investigation.dart';
import 'package:tele_healthcare/Screens/Nurse/n-registration.dart';
import 'package:tele_healthcare/Screens/createUser.dart';

import 'package:tele_healthcare/Screens/Nurse/n-appointment.dart';
import 'package:tele_healthcare/Screens/Nurse/n-medicalHistory.dart';
import 'package:tele_healthcare/Screens/Nurse/n-vital%20signs.dart';
import 'package:tele_healthcare/Screens/dashboards/adminDashboard.dart';
import 'package:tele_healthcare/Screens/dashboards/d-dashboard.dart';
import 'package:tele_healthcare/Screens/dashboards/n-dashboard.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';
import 'package:tele_healthcare/Screens/splashscreen.dart';

import 'firebase_options.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125));

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tele-HealthCare',
      darkTheme: ThemeData.dark()
          .copyWith(brightness: Brightness.dark, colorScheme: kDarkColorScheme),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                color: kColorScheme.onSecondaryContainer, fontSize: 25),
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onPrimaryContainer,
                fontSize: 30),
            bodySmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kColorScheme.onPrimaryContainer)),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Tele-HealthCare",
            ),
            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          body: SplashScreen(),
        ),
      ),
    );
  }
}
