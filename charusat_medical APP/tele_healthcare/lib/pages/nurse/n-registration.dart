import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/pages/nurse/n-medicalHistory.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

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
  void initState() {
    super.initState();
    selectedGender = 0;
    _insurance = 0;
  }

  onSave() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Patients").doc(pID);

    Map<String, dynamic> Patients = {
      "Patient_ID": pID,
      "First_name": fname,
      "Last_name": lname,
      "Contact_No": contactNum,
      "Aadhaar_No": aadhaarNum,
      "DOB": dOB,
      "Gender": gender,
      "Occupation": occupation,
      "Address": add,
      "State": stateValue,
      "City/Village": city,
      "Taluka": taluka,
      "District": district,
      "Insurance": insuranceValue,
      "Ayushman_No": ayushmanNo
    };

    documentReference.set(Patients).whenComplete(() => Fluttertoast.showToast(
        msg: "User $pID created",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.blue));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MedicalHistory(
                  patientId: _patientID.text,
                ))));
    // clearText();
  }

  @override
  Widget build(BuildContext context) {
    var select = "Select one";
    return Form(
      key: _registrationformkey,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
              //     child: Text("Registration",
              //         style: GoogleFonts.varelaRound(
              //           textStyle: TextStyle(
              //               fontSize: 30,
              //               fontFamily: 'Lato',
              //               fontWeight: FontWeight.bold,
              //               color: Colors.indigo),
              //         )),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 200,
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
                        icon: Icon(Icons.add_circle_outline_sharp),
                      ),
                    )
                  ],
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Patient ID:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 33),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Patient ID";

                            return null;
                          },
                          enabled: patientIDEnabled,
                          focusNode: FocusNode(),
                          enableInteractiveSelection: patientIDEnabled,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Patient Name:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: SizedBox(
                          width: 200,
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
                        width: 210,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
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
                                // hintText: "Enter the Patient Lastname",
                                labelText: "Last Name"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 105,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Contact Number:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 200,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Aadhaar Number:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 10, top: 10, bottom: 10),
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
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Date of Birth:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    child: SizedBox(
                      width: 210,
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
                              border: OutlineInputBorder(), labelText: "DOB"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Gender:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
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
                          width: 130,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Occupation:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 26),
                    child: SizedBox(
                      width: 200,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Address:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 47),
                    child: SizedBox(
                      width: 200,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "State:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 70),
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "City/Village:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 28),
                    child: SizedBox(
                      width: 200,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Taluka:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 61),
                    child: SizedBox(
                      width: 200,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "District:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 54),
                    child: SizedBox(
                      width: 203,
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
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Text(
              //         "Postal Address:",
              //         style: TextStyle(fontSize: 15),
              //       ),
              //     ),
              //     Container(
              //       margin: const EdgeInsets.only(left: 3),
              //       child: SizedBox(
              //         width: 270,
              //         child: Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: TextFormField(
              //             validator: (value) {
              //               String postaladd = _postaladd.text;
              //               bool isValidPostalAdd =
              //                   postalAddPattern.hasMatch(postaladd);
              //               if (value == null || value.isEmpty)
              //                 return "Please Enter Postal Address";
              //               else if (!isValidPostalAdd)
              //                 return "Please Enter Valid Postal Address";

              //               return null;
              //             },
              //             controller: _postaladd,
              //             keyboardType: TextInputType.number,
              //             decoration: InputDecoration(
              //                 border: OutlineInputBorder(),
              //                 labelText: "Postal Address"),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Text(
              //         "Mobile:",
              //         style: TextStyle(fontSize: 15),
              //       ),
              //     ),
              //     Container(
              //       margin: const EdgeInsets.only(left: 57),
              //       child: SizedBox(
              //         width: 203,
              //         child: Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: TextFormField(
              //             validator: (value) {
              //               if (value == null || value.isEmpty)
              //                 return "Please Enter Mobile";

              //               return null;
              //             },
              //             controller: _mobile,
              //             keyboardType: TextInputType.number,
              //             inputFormatters: [
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //             decoration: InputDecoration(
              //                 border: OutlineInputBorder(),
              //                 labelText: "Mobile ID"),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Insurance:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Ayushman Card:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 200,
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
                  )
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {
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
                                if (_registrationformkey.currentState!
                                    .validate()) {
                                  onSave();
                                  value = value + 1;
                                }
                              },
                              child: Text("Save"))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Back"))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
