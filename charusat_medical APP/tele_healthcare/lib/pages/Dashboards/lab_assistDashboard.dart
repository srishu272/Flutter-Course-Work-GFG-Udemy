import 'package:flutter/material.dart';
import 'package:tele_healthcare/pages/homePage.dart';
import 'package:tele_healthcare/pages/loginPage.dart';

class Lab_AssistDashboard extends StatefulWidget {
  const Lab_AssistDashboard({super.key});

  @override
  State<Lab_AssistDashboard> createState() => _Lab_AssistDashboardState();
}

class _Lab_AssistDashboardState extends State<Lab_AssistDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tele HealthCare")),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout_rounded),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => LoginPage())),
                (route) => false);
          }),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                        child: Column(
                          children: [
                            Icon(
                              Icons.bloodtype,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              "Patient Body Test",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
