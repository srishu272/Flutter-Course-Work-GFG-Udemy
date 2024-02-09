import 'package:flutter/material.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';
import 'package:tele_healthcare/widgets/dashboardTile.dart';

class Lab_AssistDashboard extends StatefulWidget {
  const Lab_AssistDashboard({super.key});

  @override
  State<Lab_AssistDashboard> createState() => _Lab_AssistDashboardState();
}

class _Lab_AssistDashboardState extends State<Lab_AssistDashboard> {
  String tile1Msg = "Patient Body Test";
  Icon icon1 = const Icon(
    Icons.bloodtype,
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
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                DashboardTile(
                    icon: icon1,
                    text: tile1Msg,
                    nextPage: Text(tile1Msg)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
