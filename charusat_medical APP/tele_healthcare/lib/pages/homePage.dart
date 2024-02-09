import 'package:flutter/material.dart';
import 'package:tele_healthcare/pages/Dashboards/adminDashboard.dart';
import 'package:tele_healthcare/pages/billing.dart';
import 'package:tele_healthcare/pages/createUser.dart';
import 'package:tele_healthcare/pages/doctor/d-finalDiagnosis&Appointment.dart';
import 'package:tele_healthcare/pages/lab-assist/lab-investigation.dart';
import 'package:tele_healthcare/pages/nurse/n-appointment.dart';
import 'package:tele_healthcare/pages/nurse/n-finalDiagnosis.dart';
import 'package:tele_healthcare/pages/nurse/n-investigation.dart';
import 'package:tele_healthcare/pages/nurse/n-medicalHistory.dart';
import 'package:tele_healthcare/pages/nurse/n-registration.dart';
import 'package:tele_healthcare/pages/nurse/n-vitalSigns.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Registration(),
    // MedicalHistory(patientId: '',),
    VitalSigns(),
    InvestigationRequisition(),
    Lab_Investigation_Requisition(),
    FinalDiagnosis(),
    Appointment(),
    D_FinalDiagnosis_Appointment(),
    Billing(),
    UserCreation(),
    AdminDashboard(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tele HealthCare")),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: _pages[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('N-Registration'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('N-Medical History'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('N-Vital Signs'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('N-Investigation Requisition'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lab-Investigation Requisition'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('N-Final Diagnosis and Care Plan'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('N-Appointment'),
              selected: _selectedIndex == 6,
              onTap: () {
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:
                  const Text('D-Final Diagnosis and Care Plan and Appointment'),
              selected: _selectedIndex == 7,
              onTap: () {
                _onItemTapped(7);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Billing'),
              selected: _selectedIndex == 8,
              onTap: () {
                _onItemTapped(8);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('User Creation'),
              selected: _selectedIndex == 9,
              onTap: () {
                _onItemTapped(9);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Admin Dashboard'),
              selected: _selectedIndex == 10,
              onTap: () {
                _onItemTapped(10);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Login Page'),
              selected: _selectedIndex == 11,
              onTap: () {
                _onItemTapped(11);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
