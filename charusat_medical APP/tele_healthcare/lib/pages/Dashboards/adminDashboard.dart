import 'package:flutter/material.dart';
import 'package:tele_healthcare/pages/createUser.dart';
import 'package:tele_healthcare/pages/loginPage.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
                                builder: (context) => const UserCreation()));
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
                              "Add/Edit User",
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
