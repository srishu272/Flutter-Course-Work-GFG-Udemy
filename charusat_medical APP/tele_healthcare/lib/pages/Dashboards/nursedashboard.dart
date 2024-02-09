import 'package:flutter/material.dart';
import 'package:tele_healthcare/pages/homePage.dart';
import 'package:tele_healthcare/pages/loginPage.dart';

class NurseDashboard extends StatefulWidget {
  const NurseDashboard({super.key});

  @override
  State<NurseDashboard> createState() => _NurseDashboardState();
}

class _NurseDashboardState extends State<NurseDashboard> {
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
                              Icons.person_add,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              "Add/Edit Patient",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      )),
                ),
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
                            EdgeInsets.symmetric(vertical: 23, horizontal: 0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.medication_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              "Medicines",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
