// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/Screens/Doctor/d-finalDiagnosis&Appointment.dart';
import 'package:tele_healthcare/Screens/Nurse/n-appointment.dart';
import 'package:tele_healthcare/Screens/Nurse/n-investigation.dart';
import 'package:tele_healthcare/Screens/Nurse/n-medicalHistory.dart';
import 'package:tele_healthcare/Screens/Nurse/n-vital%20signs.dart';
import 'package:tele_healthcare/Screens/dashboards/adminDashboard.dart';
import 'package:tele_healthcare/Screens/dashboards/d-dashboard.dart';
import 'package:tele_healthcare/Screens/dashboards/lab_assitDashboard.dart';
import 'package:tele_healthcare/Screens/dashboards/n-dashboard.dart';
import 'package:tele_healthcare/Screens/dashboards/pharmacistDashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _LoginFormKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String email = "", password = "";
  bool passwordVisible = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<bool> isDocumentExists(String docName) async {
    print(docName);
    final snapShot = await FirebaseFirestore.instance.collection('Users').doc(docName).get();
    if (snapShot.exists){
      return true;
    }
    return false;

  }

  Future<String> getPasswordfromDB(String docName) async {
    String passwordfromDB = "";
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(docName)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        passwordfromDB = snapshot.data()!['password'].toString();
      }
    });
    return passwordfromDB;
  }

  Future<String> getUserTypefromDB(String docName) async {
    String userTypefromDB = "";
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(docName)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        userTypefromDB = snapshot.data()!['userType'].toString();
      }
    });
    return userTypefromDB;
  }

  Future<bool> isPasswordCorrect(String docName, String pass) async {
    Future<String> passFromDB = getPasswordfromDB(docName);

    if (await passFromDB == pass) return true;

    return false;
  }

  onLogin(String docName) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Future<bool> docExists = isDocumentExists(docName);
      Future<String> userTypefromDB = getUserTypefromDB(docName);
      if (await docExists) {
        if (await isPasswordCorrect(docName, password)) {
          if (await userTypefromDB == "Admin") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => AdminDashboard())),
                (route) => false);
          }
          if (await userTypefromDB == "Nurse") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => NurseDashboard())),
                (route) => false);
          }
          if (await userTypefromDB == "Doctor/Physician") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => DoctorDashboard())),
                (route) => false);
          }
          if (await userTypefromDB == "Lab Assistant") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: ((context) => Lab_AssistDashboard())),
                (route) => false);
          }
          if (await userTypefromDB == "Pharmacist") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: ((context) => PharmacistDashboard())),
                (route) => false);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Enter Valid Password')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter Valid Login Name-Password')),
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.red);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tele-HealthCare",
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        body: Form(
            key: _LoginFormKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please Enter Email Address";

                        return null;
                      },
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email Address"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please Enter Password";

                        return null;
                      },
                      obscureText: !passwordVisible,
                      controller: _password,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            if (!_LoginFormKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: Text("Invalid Input"),
                                        content: Text(
                                            "Please make sure a valid email and password is entered"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Okay, Close it"))
                                        ],
                                      ));
                            } else {
                              setState(() {
                                email = _email.text;
                                password = _password.text;
                              });
                              print(email);
                              print(password);
                              onLogin(email);
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 17),
                          )),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
