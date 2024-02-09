import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class D_FinalDiagnosis_Appointment extends StatefulWidget {
  const D_FinalDiagnosis_Appointment({Key? key}) : super(key: key);

  @override
  State<D_FinalDiagnosis_Appointment> createState() =>
      _D_FinalDiagnosis_AppointmentState();
}

class _D_FinalDiagnosis_AppointmentState
    extends State<D_FinalDiagnosis_Appointment> {
  final _D_finalDiagnosisFormKey = GlobalKey<FormState>();
  final _patientID = TextEditingController();
  final _patientDate = TextEditingController();
  final _visitDay = TextEditingController();
  var medication;
  bool morning = false;
  bool afternoon = false;
  bool night = false;
  final _carePlan = TextEditingController();
  final _nextAppointment = TextEditingController();
  final _notes = TextEditingController();

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

    return Scaffold(
      appBar: AppBar(title: Text("Tele HealthCare")),
      body: Form(
        key: _D_finalDiagnosisFormKey,
        child: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text("Final Diagnosis and Care Plan",
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
                      width: 200,
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
                      width: 240,
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
                      width: 250,
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
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: Text("Appointment",
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
                        width: 115,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Next          Appointment:",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 255,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextfieldDatePicker(
                              cupertinoDatePickerBackgroundColor: Colors.white,
                              cupertinoDatePickerMaximumDate: DateTime.now(),
                              cupertinoDatePickerMaximumYear: 2024,
                              cupertinoDatePickerMinimumYear: 1900,
                              cupertinoDatePickerMinimumDate: DateTime.now(),
                              cupertinoDateInitialDateTime: DateTime.now(),
                              materialDatePickerFirstDate: DateTime.now(),
                              materialDatePickerInitialDate: DateTime.now(),
                              materialDatePickerLastDate: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month + 6,
                                  DateTime.now().day),
                              preferredDateFormat: DateFormat.yMd(),
                              textfieldDatePickerController: _nextAppointment,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Next Appointment"),
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
                          "Notes:",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 56),
                        child: SizedBox(
                          width: 242,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _notes,
                              keyboardType: TextInputType.text,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Notes"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
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
                            if (_D_finalDiagnosisFormKey.currentState!
                                .validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Text("Submit"))),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
