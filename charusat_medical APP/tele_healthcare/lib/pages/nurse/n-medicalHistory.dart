import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void onSave() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tele HealthCare"),
      ),
      body: Form(
        key: _medicalHistoryFormKey,
        child: Container(
            child: SingleChildScrollView(
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 20, bottom: 20),
                child: Text("Medical History",
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
                      "Chief Complaints:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 210,
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
                      "Duration   (in weeks):",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(9),
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
                  width: 112,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Past Surgical History:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 210,
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
                  width: 112,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Family history of hypertension:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 210,
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Family history of diabetes:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "History of Heart Attack:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
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
                  width: 112,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Diet:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 210,
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Exercise:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Addiction:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Others:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
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
                            border: OutlineInputBorder(), labelText: "Others"),
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
                  width: 112,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Medicines:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Medicines";

                          return null;
                        },
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Dosage:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Dosage";

                          return null;
                        },
                        controller: _dosage,
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Dosage"),
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
                      "Duration:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Duration";

                          return null;
                        },
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Allergy History:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Allergy History";

                          return null;
                        },
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
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_medicalHistoryFormKey.currentState!.validate()) {
                            onSave();
                          }
                        },
                        child: Text("Save"))),
              ),
            )
          ]),
        )),
      ),
    );
  }
}
