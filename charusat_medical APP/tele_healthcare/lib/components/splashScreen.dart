import 'package:flutter/material.dart';
import 'package:tele_healthcare/pages/loginPage.dart';

class Splash_Screen extends StatefulWidget {
  final Widget? child;
  Splash_Screen({Key? key, this.child}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => LoginPage())),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Welcome to Tele HeathCare",
        style: TextStyle(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}
