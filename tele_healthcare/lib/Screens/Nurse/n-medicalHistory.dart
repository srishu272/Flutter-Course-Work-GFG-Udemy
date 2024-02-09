import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/Screens/Nurse/n-vital%20signs.dart';

class MedicalHistory extends StatefulWidget {
  final String patientId;

  MedicalHistory({super.key, required this.patientId});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final _medicalHistoryFormKey = GlobalKey<FormState>();
  final _chiefComplaints = TextEditingController();
  final _complaintsDuration = TextEditingController();
  final _pastSurgicalHistory = TextEditingController();
  final _hypertension = TextEditingController();
  final _diabetes = TextEditingController();
  final _heartattack = TextEditingController();
  final _diet = TextEditingController();
  final _exercise = TextEditingController();
  final _addiction = TextEditingController();
  final _personalHistoryOther = TextEditingController();
  final _medicines = TextEditingController();
  final _dosage = TextEditingController();
  final _medicineDuration = TextEditingController();
  final _allergy = TextEditingController();
  String chiefComplaints = "",
      complaintDuration = "",
      pastSurgicalHistory = "",
      hypertension = "",
      diabetes = "",
      heartAttack = "",
      diet = "",
      exercise = "",
      addiction = "",
      personalHistoryOther = "",
      medicines = "",
      dosage = "",
      medicineDuration = "",
      allergy = "";

  @override
  void dispose() {
    super.dispose();
    _chiefComplaints.dispose();
    _complaintsDuration.dispose();
    _pastSurgicalHistory.dispose();
    _hypertension.dispose();
    _diabetes.dispose();
    _heartattack.dispose();
    _diet.dispose();
    _exercise.dispose();
    _addiction.dispose();
    _personalHistoryOther.dispose();
    _medicines.dispose();
    _dosage.dispose();
    _medicineDuration.dispose();
    _allergy.dispose();
  }

  void clearText() {
    setState(() {
      _chiefComplaints.clear();
      _complaintsDuration.clear();
      _pastSurgicalHistory.clear();
      _hypertension.clear();
      _diabetes.clear();
      _heartattack.clear();
      _diet.clear();
      _exercise.clear();
      _addiction.clear();
      _personalHistoryOther.clear();
      _medicines.clear();
      _dosage.clear();
      _medicineDuration.clear();
      _allergy.clear();
    });
  }

  void onSave() async {
    try {
      String patientID = widget.patientId;
      await FirebaseFirestore.instance
          .collection("Patient-Medical-History")
          .doc(patientID)
          .set({
        'patient-ID': patientID,
        'chief-Complaints': chiefComplaints,
        'duration': complaintDuration,
        'past-SurgicalHistory': pastSurgicalHistory,
        'family-HistoryOfHypertension': hypertension,
        'family-HistoryOfDiabetes': diabetes,
        'historyOfHeartAttack': heartAttack,
        'personal-diet': diet,
        'personal-exercise': exercise,
        'personal-addiction': addiction,
        'personal-Others': personalHistoryOther,
        'curr-Medicines': medicines,
        'curr-medicine-Dosage': dosage,
        'curr-medicine-Duration': medicineDuration,
        'allergy-History': allergy
      }).then((value) =>
          Fluttertoast.showToast(
            msg: 'Patient Medical History Added',
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
          title: Text("Patient Medical History"),
        ),
        body: Form(
          key: _medicalHistoryFormKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 112,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Chief      Complaints:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Chief Complaints";

                            return null;
                          },
                          controller: _chiefComplaints,
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Chief Complaints"),
                        ),
                      ),
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
                      child: Text("Duration     (in weeks):",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Duration";

                            return null;
                          },
                          controller: _complaintsDuration,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Duration"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5),
                  child: Text(
                    "Past History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Past Surgical History:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Past Surgical History";

                            return null;
                          },
                          controller: _pastSurgicalHistory,
                          keyboardType: TextInputType.text,
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Past Surgical History"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5),
                  child: Text(
                    "Family History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Family history of hypertension:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Family History of Hypertension";

                            return null;
                          },
                          controller: _hypertension,
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Family History of Hypertension"),
                        ),
                      ),
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
                      child: Text("Family history of diabetes:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Family History of Diabetes";

                            return null;
                          },
                          controller: _diabetes,
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Family History of Diabetes"),
                        ),
                      ),
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
                      child: Text("History of Heart Attack:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter History of Heart Attack";

                            return null;
                          },
                          controller: _heartattack,
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "History of Heart Attack"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5),
                  child: Text(
                    "Personal History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Diet:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Diet";

                            return null;
                          },
                          controller: _diet,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Diet"),
                        ),
                      ),
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
                      child: Text("Exercise:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Exercise";

                            return null;
                          },
                          controller: _exercise,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Exercise"),
                        ),
                      ),
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
                      child: Text("Addiction:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Addiction";

                            return null;
                          },
                          controller: _addiction,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Addiction"),
                        ),
                      ),
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
                      child: Text("Others:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Please Enter Others";

                            return null;
                          },
                          controller: _personalHistoryOther,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Others"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5),
                  child: Text(
                    "Current Medication History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Medicines:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          // validator: (value) {
                          //   if (value == null || value.isEmpty)
                          //     return "Please Enter Medicines";
                          //
                          //   return null;
                          // },
                          controller: _medicines,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Medicines"),
                        ),
                      ),
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
                      child: Text("Dosage:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          // validator: (value) {
                          //   if (value == null || value.isEmpty)
                          //     return "Please Enter Dosage";
                          //
                          //   return null;
                          // },
                          controller: _dosage,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Dosage"),
                        ),
                      ),
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
                      child: Text("Duration:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          // validator: (value) {
                          //   if (value == null || value.isEmpty)
                          //     return "Please Enter Duration";
                          //
                          //   return null;
                          // },
                          controller: _medicineDuration,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Duration"),
                        ),
                      ),
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
                      child: Text("Allergy History:",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          // validator: (value) {
                          //   if (value == null || value.isEmpty)
                          //     return "Please Enter Allergy History";
                          //
                          //   return null;
                          // },
                          controller: _allergy,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Allergy History"),
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
                            Navigator.of(context).pop();
                          },
                          child: Text("Back"))),
                  SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_medicalHistoryFormKey.currentState!
                                .validate()) {
                              setState(() {
                                chiefComplaints = _chiefComplaints.text;
                                complaintDuration = _complaintsDuration.text;
                                pastSurgicalHistory= _pastSurgicalHistory.text;
                                hypertension = _hypertension.text;
                                diabetes = _diabetes.text;
                                heartAttack = _heartattack.text;
                                diet = _diet.text;
                                exercise = _exercise.text;
                                addiction = _addiction.text;
                                personalHistoryOther = _personalHistoryOther.text;
                                medicines = _medicines.text;
                                dosage = _dosage.text;
                                medicineDuration = _medicineDuration.text;
                                allergy = _allergy.text;
                              });
                              onSave();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => VitalSigns(patientID: widget.patientId,))));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) =>
                                      AlertDialog(
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
                          child: Text("Save")))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
