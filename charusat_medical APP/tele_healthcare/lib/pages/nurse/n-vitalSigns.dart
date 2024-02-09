import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';

class VitalSigns extends StatefulWidget {
  const VitalSigns({super.key});

  @override
  State<VitalSigns> createState() => _VitalSignsState();
}

class _VitalSignsState extends State<VitalSigns> {
  final _vitalSignsKey = GlobalKey<FormState>();
  final _date = TextEditingController();
  final _time = TextEditingController();
  var _patientSeated;
  final _sBP = TextEditingController();
  final _dBP = TextEditingController();
  final _pulse = TextEditingController();
  final _temperature = TextEditingController();
  var _visitLocation;
  final _weight = TextEditingController();
  final _height = TextEditingController();
  var _bmi = TextEditingController();
  var _head,
      _eyes,
      _ears,
      _nose,
      _throat,
      _respiratory,
      _cardiovascular,
      _hematological;
  var _neurological, _gastrointestinal, _dental, _urinarytest;
  final _headnote = TextEditingController();
  final _eyesnote = TextEditingController();
  final _earsnote = TextEditingController();
  final _nosenote = TextEditingController();
  final _throatnote = TextEditingController();
  final _respiratorynote = TextEditingController();
  final _cardionote = TextEditingController();
  final _hematologicalnote = TextEditingController();
  final _neuronote = TextEditingController();
  final _gastronote = TextEditingController();
  final _dentalnote = TextEditingController();
  final _urinarynote = TextEditingController();
  var _hernia, _musculoskeletal, _metabolism, _psychiatric, _skin;

  @override
  void initState() {
    super.initState();
    _patientSeated = 0;
    _visitLocation = 0;
    _head = 0;
    _eyes = 0;
    _ears = 0;
    _nose = 0;
    _throat = 0;
    _respiratory = 0;
    _cardiovascular = 0;
    _hematological = 0;
    _neurological = 0;
    _gastrointestinal = 0;
    _dental = 0;
    _urinarytest = 0;
    _hernia = 0;
    _musculoskeletal = 0;
    _metabolism = 0;
    _psychiatric = 0;
    _skin = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _vitalSignsKey,
        child: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text("Vital Signs",
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
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Date:",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            width: 130,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextfieldDatePicker(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Please Select a Date";

                                  return null;
                                },
                                cupertinoDatePickerBackgroundColor:
                                    Colors.indigoAccent,
                                cupertinoDatePickerMaximumDate: DateTime.now(),
                                cupertinoDatePickerMaximumYear: 2024,
                                cupertinoDatePickerMinimumYear: 1900,
                                cupertinoDatePickerMinimumDate: DateTime(1900),
                                cupertinoDateInitialDateTime: DateTime.now(),
                                materialDatePickerFirstDate: DateTime(1900),
                                materialDatePickerInitialDate: DateTime.now(),
                                materialDatePickerLastDate: DateTime.now(),
                                preferredDateFormat: DateFormat.yMd(),
                                textfieldDatePickerController: _date,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Date"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            "Time:",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            width: 130,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextfieldTimePicker(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Please Set Time";

                                  return null;
                                },
                                cupertinoDatePickerBackgroundColor:
                                    Colors.white,
                                cupertinoDateInitialDateTime: DateTime.now(),
                                materialInitialTime: TimeOfDay.now(),
                                materialTimePickerUse24hrFormat: false,
                                cupertinoTimePickerMinuteInterval: 1,
                                cupertinoTimePickerUse24hFormat: false,
                                textfieldDateAndTimePickerController: _time,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Time"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 120,
                      child: Text(
                        "Was the Patient Seated for 5 minutes:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: _patientSeated,
                            onChanged: (value) {
                              setState(() {
                                _patientSeated = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: _patientSeated,
                            onChanged: (value) {
                              setState(() {
                                _patientSeated = value;
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
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Systolic Blood Pressure:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Systolic Blood Pressure";
                            else if (int.parse(value) < 0 ||
                                int.parse(value) > 500)
                              return "Please Enter a Value between 0 to 500";
                            return null;
                          },
                          controller: _sBP,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Systolic Blood Pressure"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Diastolic Blood Pressure:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Diastolic Blood Pressure";
                            else if (int.parse(value) < 0 ||
                                int.parse(value) > 500)
                              return "Please Enter a Value between 0 to 500";
                            return null;
                          },
                          controller: _dBP,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Diastolic Blood Pressure"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Pulse:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Pulse";
                            else if (int.parse(value) < 0 ||
                                int.parse(value) > 500)
                              return "Please Enter a Value between 0 to 500";

                            return null;
                          },
                          controller: _pulse,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Pulse"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Temperature:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Temperature";
                            else if (double.parse(value) < 70.0 ||
                                int.parse(value) > 150.0)
                              return "Please Enter a Value between 70 to 150";

                            return null;
                          },
                          controller: _temperature,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^\d{0,9}[\.,\,]?\d{0,6}"))
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Temperature"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 120,
                      child: Text(
                        "Visit Location",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          child: RadioListTile(
                            title: const Text("Home"),
                            value: 1,
                            groupValue: _visitLocation,
                            onChanged: (value) {
                              setState(() {
                                _visitLocation = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 150,
                          child: RadioListTile(
                            title: const Text("Hospital"),
                            value: 2,
                            groupValue: _visitLocation,
                            onChanged: (value) {
                              setState(() {
                                _visitLocation = value;
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
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Weight:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Weight";
                            else if (double.parse(value) < 10.0 ||
                                int.parse(value) > 500.0)
                              return "Please Enter a Value between 10 to 500";

                            return null;
                          },
                          controller: _weight,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^\d{0,9}[\.,\,]?\d{0,6}"))
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Weight"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "KG",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Height:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Height";
                            else if (int.parse(value) < 10 ||
                                int.parse(value) > 200)
                              return "Please Enter a Value between 10 to 200";

                            return null;
                          },
                          controller: _height,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Height"),
                          onSaved: (value) {
                            double height = double.parse(value!) * 0.01;
                            double weight = double.parse((_weight.text)!);
                            setState(() {
                              _bmi = (weight / (height * height))
                                  as TextEditingController;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "CM",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "BMI:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: _bmi.text,
                          readOnly: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "BMI"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "KG/M2",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Head:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _head,
                              onChanged: (value) {
                                setState(() {
                                  _head = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _head,
                              onChanged: (value) {
                                setState(() {
                                  _head = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _headnote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Eyes:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _eyes,
                              onChanged: (value) {
                                setState(() {
                                  _eyes = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _eyes,
                              onChanged: (value) {
                                setState(() {
                                  _eyes = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (int.parse(_eyes.value!) == 2 &&
                                    value == null)
                                  return "Please Enter the Note";
                              },
                              controller: _eyesnote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Ears:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _ears,
                              onChanged: (value) {
                                setState(() {
                                  _ears = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _ears,
                              onChanged: (value) {
                                setState(() {
                                  _ears = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _earsnote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Nose:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _nose,
                              onChanged: (value) {
                                setState(() {
                                  _nose = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _nose,
                              onChanged: (value) {
                                setState(() {
                                  _nose = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _nosenote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Throat:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _throat,
                              onChanged: (value) {
                                setState(() {
                                  _throat = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _throat,
                              onChanged: (value) {
                                setState(() {
                                  _throat = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _throatnote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Respira-  tory:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _respiratory,
                              onChanged: (value) {
                                setState(() {
                                  _respiratory = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _respiratory,
                              onChanged: (value) {
                                setState(() {
                                  _respiratory = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _respiratorynote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Cardio-  vascular:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _cardiovascular,
                              onChanged: (value) {
                                setState(() {
                                  _cardiovascular = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _cardiovascular,
                              onChanged: (value) {
                                setState(() {
                                  _cardiovascular = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _cardionote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Hemato-  logical:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _hematological,
                              onChanged: (value) {
                                setState(() {
                                  _hematological = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _hematological,
                              onChanged: (value) {
                                setState(() {
                                  _hematological = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _hematologicalnote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Neuro-  logical:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _neurological,
                              onChanged: (value) {
                                setState(() {
                                  _neurological = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _neurological,
                              onChanged: (value) {
                                setState(() {
                                  _neurological = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _neuronote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Gastro-  intestinal:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _gastrointestinal,
                              onChanged: (value) {
                                setState(() {
                                  _gastrointestinal = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _gastrointestinal,
                              onChanged: (value) {
                                setState(() {
                                  _gastrointestinal = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _gastronote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Dental:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _dental,
                              onChanged: (value) {
                                setState(() {
                                  _dental = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-       normal"),
                              value: 2,
                              groupValue: _dental,
                              onChanged: (value) {
                                setState(() {
                                  _dental = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _dentalnote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Urinary Test:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 141,
                            child: RadioListTile(
                              title: const Text("Normal"),
                              value: 1,
                              groupValue: _urinarytest,
                              onChanged: (value) {
                                setState(() {
                                  _urinarytest = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 140,
                            child: RadioListTile(
                              title: const Text("Ab-    normal"),
                              value: 2,
                              groupValue: _urinarytest,
                              onChanged: (value) {
                                setState(() {
                                  _urinarytest = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _urinarynote,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Note"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Hernia:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: _hernia,
                            onChanged: (value) {
                              setState(() {
                                _hernia = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: _hernia,
                            onChanged: (value) {
                              setState(() {
                                _hernia = value;
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Musculo- skeletal:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: _musculoskeletal,
                            onChanged: (value) {
                              setState(() {
                                _musculoskeletal = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: _musculoskeletal,
                            onChanged: (value) {
                              setState(() {
                                _musculoskeletal = value;
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Metabolism/Endocrine Glands:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: _metabolism,
                            onChanged: (value) {
                              setState(() {
                                _metabolism = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: _metabolism,
                            onChanged: (value) {
                              setState(() {
                                _metabolism = value;
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Neurological/ Psychiatric:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: _psychiatric,
                            onChanged: (value) {
                              setState(() {
                                _psychiatric = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: _psychiatric,
                            onChanged: (value) {
                              setState(() {
                                _psychiatric = value;
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Skin:",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 125,
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: _skin,
                            onChanged: (value) {
                              setState(() {
                                _skin = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: _skin,
                            onChanged: (value) {
                              setState(() {
                                _skin = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
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
                            if (_vitalSignsKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Text("Next"))),
                ),
              )
            ],
          )),
        ));
  }
}
