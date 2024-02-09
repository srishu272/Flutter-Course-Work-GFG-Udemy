import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tele_healthcare/components/splashScreen.dart';
import 'package:tele_healthcare/pages/createUser.dart';
import 'package:tele_healthcare/pages/loginPage.dart';
import 'package:tele_healthcare/pages/nurse/n-registration.dart';
// import 'package:tele_healthcare/pages/loginPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tele HealthCare")),
      body: Registration(),
    );
  }
}
