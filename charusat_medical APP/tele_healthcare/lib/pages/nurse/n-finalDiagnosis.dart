import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalDiagnosis extends StatefulWidget {
  const FinalDiagnosis({super.key});

  @override
  State<FinalDiagnosis> createState() => _FinalDiagnosisState();
}

class _FinalDiagnosisState extends State<FinalDiagnosis> {
  final _finalDiagnosisFormKey = GlobalKey<FormState>();
  final _patientID = TextEditingController();
  final _patientDate = TextEditingController();
  final _visitDay = TextEditingController();
  var medication;
  bool morning = false;
  bool afternoon = false;
  bool night = false;
  final _carePlan = TextEditingController();

  static const List<String> medicationList = <String>[
    "Combiflame",
    "Azithromysin"
  ];

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.blue;
    }

    return Form(
      key: _finalDiagnosisFormKey,
      child: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Text("Final Diagnosis and Care plan",
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
                    width: 215,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Patient ID";

                          return null;
                        },
                        controller: _patientID,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Patient Date:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: SizedBox(
                    width: 204,
                    child: TextfieldDatePicker(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please Select Patient Date";

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
                      textfieldDatePickerController: _patientDate,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Patient Date"),
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
                    "Visit Day:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: SizedBox(
                    width: 215,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _visitDay,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Visit Day"),
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
                    "Medication:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  width: 170,
                  margin: const EdgeInsets.only(left: 21),
                  child: Row(children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: DropdownMenu<String>(
                          initialSelection: "select",
                          onSelected: (String? value) {
                            setState(() {
                              medication = value!;
                            });
                          },
                          dropdownMenuEntries: medicationList
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined),
                      iconSize: 35,
                    )
                  ]),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: morning,
                            onChanged: (bool? value) {
                              setState(() {
                                morning = value!;
                              });
                            }),
                        Text("Morning")
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: afternoon,
                            onChanged: (bool? value) {
                              setState(() {
                                afternoon = value!;
                              });
                            }),
                        Text("Afternoon")
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: night,
                            onChanged: (bool? value) {
                              setState(() {
                                night = value!;
                              });
                            }),
                        Text("Night")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Care Plan:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  child: SizedBox(
                    width: 245,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _carePlan,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Care Plan"),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_finalDiagnosisFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: Text("Next"))),
            )
          ],
        )),
      ),
    );
  }
}
