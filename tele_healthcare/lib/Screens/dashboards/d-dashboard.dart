import 'package:flutter/material.dart';
import 'package:tele_healthcare/Screens/Doctor/d-finalDiagnosis&Appointment.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';
import 'package:tele_healthcare/widgets/dashboardTile.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  String tile1Msg = "Patient Diagnosis";
  Icon icon1 = const Icon(
    Icons.health_and_safety,
    color: Colors.black,
    size: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tele HealthCare")),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => LoginScreen())),
                (route) => false);
          },
          child: Icon(
            Icons.logout_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          )),
      body: Column(
        children: [
          Row(
            children: [
              DashboardTile(
                  icon: icon1,
                  text: tile1Msg,
                  nextPage: D_FinalDiagnosis_Appointment())
            ],
          )
        ],
      ),
    );
  }
}
