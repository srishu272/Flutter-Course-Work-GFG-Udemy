import 'package:flutter/material.dart';
import 'package:tele_healthcare/Screens/Nurse/n-registration.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';
import 'package:tele_healthcare/widgets/dashboardTile.dart';

class NurseDashboard extends StatefulWidget {
   NurseDashboard({super.key});

  @override
  State<NurseDashboard> createState() => _NurseDashboardState();
}

class _NurseDashboardState extends State<NurseDashboard> {
  String tile1Msg = "Add/Edit Patient";

  String tile2Msg = "Medicine";

  Icon icon1 = Icon(
    Icons.person_add,
    color: Colors.black,
    size: 30,
  );

  Icon icon2 = Icon(
    Icons.medication_rounded,
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
                  nextPage: Registration()),
              DashboardTile(
                  icon: icon2,
                  text: tile2Msg,
                  nextPage: const Text("Medicine"))
            ],
          )
        ],
      ),
    );
  }
}
