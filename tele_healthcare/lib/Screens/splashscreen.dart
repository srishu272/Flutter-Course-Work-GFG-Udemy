import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashTime = 5;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashTime), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/Animation - 1705088111409 (1).json'),
          Center(
              child: Text(
            "Welcome to Tele-HealthCare",
            style: Theme.of(context).textTheme.titleLarge,
          )),
        ],
      ),
    );
  }
}
