import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/Screens/Nurse/n-investigation.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';

class VitalSigns extends StatefulWidget {
  const VitalSigns({super.key, required this.patientID});

  final String patientID;

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
  void dispose() {
    super.dispose();
    _date.dispose();
    _time.dispose();
    _sBP.dispose();
    _dBP.dispose();
    _pulse.dispose();
    _temperature.dispose();
    _weight.dispose();
    _height.dispose();
    _bmi.dispose();
    _headnote.dispose();
    _eyesnote.dispose();
    _earsnote.dispose();
    _nosenote.dispose();
    _throatnote.dispose();
    _respiratorynote.dispose();
    _cardionote.dispose();
    _hematologicalnote.dispose();
    _neuronote.dispose();
    _gastronote.dispose();
    _dentalnote.dispose();
    _urinarynote.dispose();
  }
  void onSave() async{
    try {
      String patientID = widget.patientID;
      await FirebaseFirestore.instance
          .collection("Patient-Vital-Signs")
          .doc(patientID)
          .set({
        'patient-ID': patientID,
        'date': _date.text,
        'time': _time.text,
        'patientSeated': _patientSeated == 1? "Yes":"No",
        'systolicBP': _sBP.text,
        'diasystolicBP': _dBP.text,
        'pulse': _pulse.text,
        'temperature': _temperature.text,
        'visitLocation': _visitLocation == 1? "Home":"Hospital",
        'weight': _weight.text,
        'height': _height.text,
        'bmi': _bmi.text,
        'head': _head == 1 ? "Normal":"Abnormal",
        'headNote': _headnote.text,
        'eyes': _head == 1 ? "Normal":"Abnormal",
        'eyesNotes': _eyesnote.text,
        'ears': _head == 1 ? "Normal":"Abnormal",
        'earsNote': _earsnote.text,
        'nose': _nose == 1 ? "Normal":"Abnormal",
        'noseNote': _nosenote.text,
        'throat': _throat == 1 ? "Normal":"Abnormal",
        'throatNote': _throatnote.text,
        'respiratory': _head == 1 ? "Normal":"Abnormal",
        'respiratoryNote': _respiratorynote.text,
        'cardiovascularTest': _cardiovascular == 1 ? "Normal":"Abnormal",
        'cardioNote': _cardionote.text,
        'hematoLogicalTest': _hematological == 1 ? "Normal":"Abnormal",
        'hematologicalNote': _hematologicalnote.text,
        'neuroLogicalTest': _neurological == 1 ? "Normal":"Abnormal",
        'neroNote': _neuronote.text,
        'gastrointetinalTest': _gastrointestinal == 1 ? "Normal":"Abnormal",
        'gastroNote': _gastronote.text,
        'dentalTest': _dental == 1 ? "Normal":"Abnormal",
        'dentalNote': _dentalnote.text,
        'urinaryTest': _urinarytest == 1 ? "Normal":"Abnormal",
        'urinaryNote': _urinarynote.text,
        'hernia': _hernia == 1 ? "Yes":"No",
        'musculoskeletal': _musculoskeletal == 1 ? "Yes":"No",
        'metabolism/endocrine': _metabolism == 1 ? "Yes":"No",
        'neuro/psychiatric': _psychiatric == 1 ? "Yes":"No",
        'skin': _skin == 1 ? "Yes":"No",
      }).then((value) =>
          Fluttertoast.showToast(
            msg: 'Patient Vital Signs Added',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          ));
      // clearText();
    } catch (e) {
      Fluttertoast.showToast(
        msg: '$e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Patient Vital-Signs",
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        body: Form(
          key: _vitalSignsKey,
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
                          "Date:",
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
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Time:",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextfieldTimePicker(
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Set Time";

                              return null;
                            },
                            cupertinoDatePickerBackgroundColor: Colors.white,
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
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          "Was the Patient Seated for   5 minutes:",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 130,
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
                          SizedBox(
                            width: 120,
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
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Systolic Blood Pressure:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
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
                            decoration: const InputDecoration(
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
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Diastolic Blood Pressure:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
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
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Pulse:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
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
                                border: OutlineInputBorder(),
                                labelText: "Pulse"),
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
                        child: Text("Temperature:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
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
                        width: 100,
                        child: Text("Visit Location",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Column(
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
                          margin: EdgeInsets.only(left: 20),
                          width: 170,
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
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Weight:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
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
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Height:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
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
                              // setState(() {
                              //   double bmi = (weight / (height * height));
                              //   _bmi.text = bmi.toString();
                              // });
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
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("BMI:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            // initialValue: _bmi.text,
                            // readOnly: true,
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
                        padding: const EdgeInsets.all(10),
                        child: Text("Head:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Eyes:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                                  // validator: (value) {
                                  //   if (int.parse(_eyes!) == 2 &&
                                  //       value == null)
                                  //     return "Please Enter the Note";
                                  // },
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Ears:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Nose:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Throat:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Respira-  tory:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Cardio-  vascular:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Hemato-  logical:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Neuro-  logical:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Gastro-  intestinal:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Dental:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Urinary Test:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 152,
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
                                width: 155,
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Hernia:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
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
                            width: 120,
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
                    SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Musculo- skeletal:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
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
                            width: 120,
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
                    SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Metabolism/Endocrine Glands:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
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
                            width: 120,
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
                    SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Neurological/ Psychiatric:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
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
                            width: 120,
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
                    SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Skin:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
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
                            width: 120,
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
                              Navigator.of(context).pop();
                            },
                            child: Text("Back"))),
                    SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_vitalSignsKey.currentState!.validate()) {
                                onSave();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => InvestigationRequisition(patientID: widget.patientID,))));
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
                            child: Text("Next")))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
