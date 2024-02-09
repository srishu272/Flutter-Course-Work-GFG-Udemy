import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/Screens/Nurse/n-medicalHistory.dart';

import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _registrationformkey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final _patientID = TextEditingController();
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _contactNum = TextEditingController();
  final _aadhaarno = TextEditingController();
  final _dateController = TextEditingController();
  var selectedGender;
  String gender = "";
  final _occupation = TextEditingController();
  final _address = TextEditingController();
  var stateValue;
  final _city = TextEditingController();
  final _taluka = TextEditingController();
  final _district = TextEditingController();

  // final _mobile = TextEditingController();
  int value = 0000000;
  bool patientIDEnabled = true;
  var _insurance;
  String insuranceValue = "";
  final _ayushman = TextEditingController();
  String pID = "",
      fname = "",
      lname = "",
      dOB = "",
      occupation = "",
      add = "",
      city = "",
      taluka = "",
      district = "",
      ayushmanNo = "";
  int contactNum = 0, aadhaarNum = 0;

  var AyushmanNoPattern = RegExp(r"^[0-9]{2}\-[0-9]{4}\-[0-9]{4}\-[0-9]{4}$");

  static const List<String> statesList = <String>[
    "Gujarat",
    "Telengana",
    "Tamil Nadu",
    "Kerela",
    "Karnataka",
    "Andhra Pradesh"
  ];

  @override
  void dispose() {
    super.dispose();
    _patientID.dispose();
    _fname.dispose();
    _lname.dispose();
    _dateController.dispose();
    _occupation.dispose();
    _address.dispose();
    _city.dispose();
    _taluka.dispose();
    _district.dispose();
    _ayushman.dispose();
    _contactNum.dispose();
    _aadhaarno.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedGender = 0;
    _insurance = 0;
  }

  void clearText() {
    setState(() {
      _patientID.clear();
      _fname.clear();
      _lname.clear();
      _dateController.clear();
      selectedGender = 0;
      _occupation.clear();
      stateValue = null;
      _address.clear();
      _city.clear();
      _taluka.clear();
      _district.clear();
      _ayushman.clear();
      _insurance = 0;
      _contactNum.clear();
      _aadhaarno.clear();
    });
  }

  onSave() {
    try {
      FirebaseFirestore.instance.collection('PatientData').doc(pID).set({
        "Patient_ID": pID,
        "First_name": fname,
        "Last_name": lname,
        "Contact_No": contactNum,
        "Aadhaar_No": aadhaarNum,
        "DOB": dOB,
        "Gender": selectedGender == 1 ? "Female" : "Male",
        "Occupation": occupation,
        "Address": add,
        "State": stateValue,
        "City/Village": city,
        "Taluka": taluka,
        "District": district,
        "Insurance": _insurance == 1 ? "Yes" : "No",
        "Ayushman_No": ayushmanNo
      }).whenComplete(() => Fluttertoast.showToast(
          msg: "User $pID created",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.blue));
      clearText();

    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    var select = "Select one";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Patient Registration",
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        body: Form(
          key: _registrationformkey,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {},
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close_outlined),
                                  onPressed: () => _searchController.clear(),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              String currYear =
                                  new DateFormat('y').format(DateTime.now());

                              pID = "TH-$currYear-$value";
                              _patientID.text = pID;
                              patientIDEnabled = false;
                            },
                            icon: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Patient ID:",
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
                                  return "Please Enter Patient ID";

                                return null;
                              },
                              controller: _patientID,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Patient ID"),
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
                            "Patient Name:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty)
                                        return "Please Enter First Name";

                                      return null;
                                    },
                                    controller: _fname,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "First Name"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Please Enter Last Name";

                                    return null;
                                  },
                                  controller: _lname,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Last Name"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Contact Number:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _contactNum,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return "Please Enter Contact Number";

                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Contact Number"),
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
                            "Aadhaar Number:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _aadhaarno,
                              // validator: (value) {
                              //   if (int.parse(value!) > 12 ||
                              //       (int.parse(value!) < 12 && int.parse(value!) > 0))
                              //     return "Please Enter Valid Aadhaar Number";

                              //   return null;
                              // },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Aadhaar Number"),
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
                            "Date of Birth:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
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
                              cupertinoDatePickerMinimumDate: DateTime(1900),
                              cupertinoDateInitialDateTime: DateTime.now(),
                              materialDatePickerFirstDate: DateTime(1900),
                              materialDatePickerInitialDate: DateTime.now(),
                              materialDatePickerLastDate: DateTime.now(),
                              preferredDateFormat: DateFormat.yMd(),
                              textfieldDatePickerController: _dateController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "DOB"),
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
                            "Gender:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 155,
                              child: RadioListTile(
                                title: const Text("Female"),
                                value: 1,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = 1;
                                    gender = "female";
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 135,
                              child: RadioListTile(
                                title: const Text("Male"),
                                value: 2,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = 2;
                                    gender = "Male";
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
                    children: [
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Occupation:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _occupation,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Occupation"),
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
                            "Address:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _address,
                              keyboardType: TextInputType.text,
                              maxLines: 2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Address"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 109,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "State:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: DropdownMenu<String>(
                          initialSelection: select,
                          onSelected: (String? value) {
                            setState(() {
                              stateValue = value!;
                            });
                          },
                          dropdownMenuEntries: statesList
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
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
                            "City/Village:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _city,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "City/Village"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Taluka:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _taluka,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Taluka"),
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
                            "District:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _district,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "District"),
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
                            "Insurance:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              child: RadioListTile(
                                title: const Text("Yes"),
                                value: 1,
                                groupValue: _insurance,
                                onChanged: (value) {
                                  setState(() {
                                    _insurance = 1;
                                    insuranceValue = "Yes";
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 130,
                              child: RadioListTile(
                                title: const Text("No"),
                                value: 2,
                                groupValue: _insurance,
                                onChanged: (value) {
                                  setState(() {
                                    _insurance = 2;
                                    insuranceValue = "No";
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
                    children: [
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Ayushman Card:",
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
                                String ayushman = _ayushman.text;
                                bool isValidAyushmanNo =
                                    AyushmanNoPattern.hasMatch(ayushman);
                                if (!isValidAyushmanNo)
                                  return "Please Enter Valid Ayushman Number";

                                return null;
                              },
                              controller: _ayushman,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Ayushman Card"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 100,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Back"))),
                      SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () {
                                if (_registrationformkey.currentState!
                                    .validate()) {
                                  setState(() {
                                    pID = _patientID.text;
                                    fname = _fname.text;
                                    lname = _lname.text;
                                    contactNum = int.parse(_contactNum.text);
                                    aadhaarNum = int.parse(_aadhaarno.text);
                                    dOB = _dateController.text;
                                    occupation = _occupation.text;
                                    add = _address.text;
                                    city = _city.text;
                                    taluka = _taluka.text;
                                    district = _district.text;
                                    ayushmanNo = _ayushman.text;
                                  });
                                  onSave();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => MedicalHistory(patientId: pID))));
                                  // value = value + 1;
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                            title: Text("Invalid Input"),
                                            content: Text(
                                                "Please make sure valid details are entered."),
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
                              child: Text("Save"))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
