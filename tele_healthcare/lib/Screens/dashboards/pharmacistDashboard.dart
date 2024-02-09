import 'package:flutter/material.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';
import 'package:tele_healthcare/widgets/dashboardTile.dart';

class PharmacistDashboard extends StatefulWidget {
  const PharmacistDashboard({super.key});

  @override
  State<PharmacistDashboard> createState() => _PharmacistDashboardState();
}

class _PharmacistDashboardState extends State<PharmacistDashboard> {
  String tile1Msg = "Pack Patient Medicines";
  Icon icon1 = Icon(
    Icons.medication,
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
                DashboardTile(icon: icon1, text: tile1Msg, nextPage:  Text(tile1Msg))
              ],
            )
          ],
        ),
      ),
    );
  }
}
