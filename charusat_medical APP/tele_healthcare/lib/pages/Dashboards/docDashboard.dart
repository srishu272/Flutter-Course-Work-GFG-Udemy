import 'package:flutter/material.dart';
import 'package:tele_healthcare/pages/doctor/d-finalDiagnosis&Appointment.dart';
import 'package:tele_healthcare/pages/loginPage.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
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
                              builder: (context) =>
                                  const D_FinalDiagnosis_Appointment()));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.health_and_safety,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            "Patient Diagnosis",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )
                        ],
                      ),
                    )),
              )
            ],
          )
        ],
      )),
    );
  }
}
