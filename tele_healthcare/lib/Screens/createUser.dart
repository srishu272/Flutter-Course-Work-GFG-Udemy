// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tele_healthcare/user.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final formatter = DateFormat.yMd();
final _firebase = FirebaseAuth.instance;

class UserCreationScreen extends StatefulWidget {
  const UserCreationScreen({super.key});

  @override
  State<UserCreationScreen> createState() => _UserCreationScreenState();
}

class _UserCreationScreenState extends State<UserCreationScreen> {
  final _createUserFormKey = GlobalKey<FormState>();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _name = TextEditingController();
  var _userType;
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool passwordVisible = false;
  final _empId = TextEditingController();
  final _accExpiryDate = TextEditingController();
  var _accStatus;
  String name = "",
      userType = "",
      email = "",
      password = "",
      empid = "",
      expiryDate = "";

  @override
  void dispose() {
    _name.dispose();
    _userType.dispose();
    _email.dispose();
    _password.dispose();
    _empId.dispose();
    _accExpiryDate.dispose();
    _accStatus.dipose();
    super.dispose();
  }

  void clearText() {
    setState(() {
      _name.clear();
      _userType = UserData.userTypeList[0];
      _empId.clear();
      _accExpiryDate.clear();
      _email.clear();
      _password.clear();
      _accStatus = 0;
    });
  }

  createUser() async {
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredentials.user!.email)
          .set({
        'user_Name': name,
        'userType': userType,
        'email': email,
        'password': password,
        'emp_id': empid,
        'accountExpiryDate': _accExpiryDate.text,
        'accountStatus': _accStatus == 1 ? "Active" : "Inactive",
      }).whenComplete(() => Fluttertoast.showToast(
                msg: "User $name created",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
              ));

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

  updateUser() async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(email).set({
        'user_Name': name,
        'userType': userType,
        'email': email,
        'password': password,
        'emp_id': empid,
        'accountExpiryDate': _accExpiryDate.text,
        'accountStatus': _accStatus == 1 ? "Active" : "Inactive",
      }).whenComplete(() => Fluttertoast.showToast(
            msg: "User $name updated",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          ));

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

  deleteUser() async {
    User? user = await _firebase.currentUser;
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

    try {
      await user
          ?.reauthenticateWithCredential(credential)
          .then((value) => {value.user?.delete().then((response) => {})});

      await FirebaseFirestore.instance
          .collection("user")
          .doc(_email.text)
          .delete()
          .whenComplete(() => Fluttertoast.showToast(
              msg: "User $name deleted",
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Creation",
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: Form(
        key: _createUserFormKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Name:",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter Name";

                              return null;
                            },
                            controller: _name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Name"),
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: DropdownMenu<String>(
                              initialSelection: "",
                              onSelected: (String? value) {
                                setState(() {
                                  _userType = value!;
                                });
                              },
                              dropdownMenuEntries: UserData.userTypeList
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
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
                    SizedBox(
                      width: 105,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Account    Expiry Date:",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
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
                        textfieldDatePickerController: _accExpiryDate,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Account Expiry Date"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Account Status:",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      // margin: const EdgeInsets.only(left: 0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: RadioListTile(
                              title: const Text("Active"),
                              value: 1,
                              groupValue: _accStatus,
                              onChanged: (value) {
                                setState(() {
                                  _accStatus = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 142,
                            child: RadioListTile(
                              title: const Text("In-active"),
                              value: 2,
                              groupValue: _accStatus,
                              onChanged: (value) {
                                setState(() {
                                  _accStatus = value;
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
                      width: 105,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent, // background
                            // onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            if (_createUserFormKey.currentState!.validate()) {
                              setState(() {
                                name = _name.text;
                                userType = _userType;
                                email = _email.text;
                                password = _password.text;
                                empid = _empId.text;
                                expiryDate = _accExpiryDate.text;
                              });
                              createUser();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: Text("Invalid Input"),
                                        content: Text(
                                            "Please make sure all the valid details are entered."),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Okay, Close it"))
                                        ],
                                      ));
                            }
                          },
                          child: Text(
                            "Create",
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 105,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // background
                          ),
                          onPressed: () {
                            if (_createUserFormKey.currentState!.validate()) {
                              setState(() {
                                name = _name.text;
                                userType = _userType;
                                email = _email.text;
                                password = _password.text;
                                empid = _empId.text;
                                expiryDate = _accExpiryDate.text;
                              });
                              updateUser();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: Text("Invalid Input"),
                                        content: Text(
                                            "Please make sure all the valid details are entered."),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Okay, Close it"))
                                        ],
                                      ));
                            }
                          },
                          child: Text(
                            "Update",
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 105,
                      margin: EdgeInsets.all(15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // background
                          ),
                          onPressed: () {
                            if (_createUserFormKey.currentState!.validate()) {
                              setState(() {
                                name = _name.text;
                                userType = _userType;
                                email = _email.text;
                                password = _password.text;
                                empid = _empId.text;
                                expiryDate = _accExpiryDate.text;
                              });
                              deleteUser();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("Invalid Input"),
                                    content: Text(
                                        "Please make sure all the valid details are entered."),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Okay, Close it"))
                                    ],
                                  ));
                            }
                          },
                          child: Text(
                            "Delete",
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 105,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // background
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
