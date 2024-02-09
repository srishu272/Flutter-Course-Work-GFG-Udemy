import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/pages/Dashboards/adminDashboard.dart';
import 'package:tele_healthcare/pages/Dashboards/docDashboard.dart';
import 'package:tele_healthcare/pages/Dashboards/lab_assistDashboard.dart';
import 'package:tele_healthcare/pages/Dashboards/nursedashboard.dart';
import 'package:tele_healthcare/pages/Dashboards/pharmacistDashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _LoginFormKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _email = TextEditingController();
  final _password = TextEditingController();
  String email = "", password = "";
  bool passwordVisible = false;

  Future<bool> isDocumentExists(String docName) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance.collection("user").doc(docName).get();

    if (document.exists) {
      return true;
    }

    return false;
  }

  Future<String> getPasswordfromDB(String docName) async {
    String passwordfromDB = "";
    await FirebaseFirestore.instance
        .collection("user")
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
        .collection("user")
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
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Tele HealthCare"),
      ),
      body: Form(
        key: _LoginFormKey,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Please Enter Email Address";

                      return null;
                    },
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email Address"),
                  ),
                ),
              ),
            ),
            Container(
              child: SizedBox(
                child: Padding(
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
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 50,
                    width: 90,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            email = _email.text;
                            password = _password.text;
                          });
                          if (_LoginFormKey.currentState!.validate()) {
                            onLogin(email);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 17),
                        ))),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
