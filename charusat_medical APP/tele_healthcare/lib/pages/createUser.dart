import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserCreation extends StatefulWidget {
  const UserCreation({super.key});

  @override
  State<UserCreation> createState() => _UserCreationState();
}

class _UserCreationState extends State<UserCreation> {
  final _createUserFormKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _userName = TextEditingController();
  var _userType;
  var _email = TextEditingController();
  var _password = TextEditingController();
  bool passwordVisible = false;
  var _empId = TextEditingController();
  var _expiryDate = TextEditingController();
  var accStatus;
  String userName = "",
      userType = "",
      email = "",
      password = "",
      empid = "",
      expiryDate = "";

  static const List<String> userTypeList = <String>[
    "",
    "Nurse",
    "Doctor/Physician",
    "Lab Assistant",
    "Pharmacist",
    "Admin",
  ];

  createUser() async {
    try {
      UserCredential userCredentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("user").doc(_email.text);

      Map<String, dynamic> Users = {
        "userName": userName,
        "userType": userType,
        "email": email,
        "password": password,
        "employeeId": empid,
        "accountExpiryDate": expiryDate,
        "accountStatus": accStatus
      };

      documentReference.set(Users).whenComplete(() => Fluttertoast.showToast(
          msg: "User $userName created",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.blue));

      clearText();
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

  updateUser() {
    // DocumentReference documentReference =
    //     FirebaseFirestore.instance.collection("user").doc(_loginName.text);

    // Map<String, dynamic> Users = {
    //   "userName": userName,
    //   "userType": userType,
    //   "loginName": loginName,
    //   "password": password,
    //   "employeeId": empid,
    //   "accountExpiryDate": expiryDate,
    //   "accountStatus": accStatus
    // };

    // documentReference.set(Users).whenComplete(() => Fluttertoast.showToast(
    //     msg: "User $userName updated",
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.CENTER));

    // clearText();
  }

  deleteUser() async {
    User? user = await _auth.currentUser;
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

    try {
      await user
          ?.reauthenticateWithCredential(credential)
          .then((value) => {value.user?.delete().then((response) => {})});

      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("user").doc(_email.text);

      documentReference.delete().whenComplete(() => Fluttertoast.showToast(
          msg: "User $userName deleted",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.blue));

      clearText();
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

  void clearText() {
    _userName.clear();
    _userType = userTypeList[0];
    _empId.clear();
    _expiryDate.clear();
    _email.clear();
    _password.clear();
    accStatus = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Tele HeathCare")),
      body: Form(
        key: _createUserFormKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text("User Creation",
                      style: GoogleFonts.varelaRound(
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      )),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Name:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Name";

                            return null;
                          },
                          onFieldSubmitted: (value) {
                            _userName.clear();
                          },
                          controller: _userName,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Name"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "User Type:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 250,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownMenu<String>(
                            initialSelection: "",
                            onSelected: (String? value) {
                              setState(() {
                                _userType = value!;
                              });
                            },
                            dropdownMenuEntries: userTypeList
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          )),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Email Address:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 220,
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
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Password:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 220,
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
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Employee ID:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Employee ID";

                            return null;
                          },
                          controller: _empId,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Employee ID"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Account     Expiry Date:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextfieldDatePicker(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Select a Date";

                          return null;
                        },
                        cupertinoDatePickerBackgroundColor: Colors.white,
                        cupertinoDatePickerMaximumDate: DateTime.now(),
                        cupertinoDatePickerMaximumYear: 2024,
                        cupertinoDatePickerMinimumYear: 1900,
                        cupertinoDatePickerMinimumDate: DateTime.now(),
                        cupertinoDateInitialDateTime: DateTime.now(),
                        materialDatePickerFirstDate: DateTime(
                            DateTime.now().year + 1,
                            DateTime.now().month,
                            DateTime.now().day),
                        materialDatePickerInitialDate: DateTime(
                            DateTime.now().year + 1,
                            DateTime.now().month,
                            DateTime.now().day),
                        materialDatePickerLastDate: DateTime(
                            DateTime.now().year + 5,
                            DateTime.now().month,
                            DateTime.now().day),
                        preferredDateFormat: DateFormat.yMd(),
                        textfieldDatePickerController: _expiryDate,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Account Expiry Date"),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Account Status:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 128,
                          child: RadioListTile(
                            title: const Text("Active"),
                            value: 1,
                            groupValue: accStatus,
                            onChanged: (value) {
                              setState(() {
                                accStatus = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 130,
                          child: RadioListTile(
                            title: const Text("In-active"),
                            value: 2,
                            groupValue: accStatus,
                            onChanged: (value) {
                              setState(() {
                                accStatus = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent, // background
                          // onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          setState(() {
                            userName = _userName.text;
                            userType = _userType;
                            email = _email.text;
                            password = _password.text;
                            empid = _empId.text;
                            expiryDate = _expiryDate.text;
                          });
                          createUser();
                        },
                        child: Text("Create")),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // background
                        ),
                        onPressed: () {
                          updateUser();
                        },
                        child: Text("Update")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // background
                        ),
                        onPressed: () {
                          deleteUser();
                        },
                        child: Text("Delete")),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: 75,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // background
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(" Back ")),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
