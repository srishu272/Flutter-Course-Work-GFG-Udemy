import 'package:flutter/material.dart';
import 'package:tele_healthcare/Screens/createUser.dart';
import 'package:tele_healthcare/Screens/loginScreen.dart';
import 'package:tele_healthcare/widgets/dashboardTile.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String tile1Msg = "Add/Edit User";
  Icon icon1 = const Icon(
    Icons.person_add,
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
                  nextPage: UserCreationScreen()),
            ],
          )
        ],
      ),
    );
  }
}
