import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tele_healthcare/Screens/dashboards/n-dashboard.dart';

class InvestigationRequisition extends StatefulWidget {
  const InvestigationRequisition({super.key, required this.patientID});

  final String patientID;

  @override
  State<InvestigationRequisition> createState() =>
      _InvestigationRequisitionState();
}

class _InvestigationRequisitionState extends State<InvestigationRequisition> {
  final _investigationFormKey = GlobalKey<FormState>();
  var cbc,
      cbc_diff,
      sodium,
      potassium,
      urea,
      creatinine,
      bun,
      rand_bloodsugar,
      hba1c,
      fasting_bloodsugar,
      ppbs,
      calcium;
  var lipid_profile, cholestrol, triglycerides, hdl, vldl, ratio;
  final other = TextEditingController();

  @override
  void initState() {
    super.initState();
    cbc = 0;
    cbc_diff = 0;
    sodium = 0;
    potassium = 0;
    urea = 0;
    creatinine = 0;
    bun = 0;
    rand_bloodsugar = 0;
    hba1c = 0;
    fasting_bloodsugar = 0;
    ppbs = 0;
    calcium = 0;
    lipid_profile = 0;
    cholestrol = 0;
    triglycerides = 0;
    hdl = 0;
    vldl = 0;
    ratio = 0;
  }

  void onSave() async {
    try {
      String patientID = widget.patientID;
      await FirebaseFirestore.instance
          .collection("Patient-Investigation-Requisition")
          .doc(patientID)
          .set({
        'patient-ID': patientID,
        'cbc': cbc == 1 ? "Yes" : "No",
        'cbc_diff': cbc_diff == 1 ? "Yes" : "No",
        'sodium': sodium == 1 ? "Yes" : "No",
        'potassium': potassium == 1 ? "Yes" : "No",
        'urea': urea == 1 ? "Yes" : "No",
        'creatinine': creatinine == 1 ? "Yes" : "No",
        'BUN': bun == 1 ? "Yes" : "No",
        'randomBloodSugar': rand_bloodsugar == 1 ? "Yes" : "No",
        'HbA1C': hba1c == 1 ? "Yes" : "No",
        'fastingBloodSugar': fasting_bloodsugar == 1 ? "Yes" : "No",
        'PPBS': ppbs == 1 ? "Yes" : "No",
        'calcium': calcium == 1 ? "Yes" : "No",
        'lipidProfile': lipid_profile == 1 ? "Yes" : "No",
        'totalCholestrol': cholestrol == 1 ? "Yes" : "No",
        'triglycerides': triglycerides == 1 ? "Yes" : "No",
        'HDL': hdl == 1 ? "Yes" : "No",
        'VLDL': vldl == 1 ? "Yes" : "No",
        'ratio': ratio == 1 ? "Yes" : "No",
        'AnyOtherTest' : other.text,
      }).then((value) => Fluttertoast.showToast(
                msg: 'Patient Investigation Requisition Added',
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
          title: Text("Patient Investigation"),
        ),
        body: Form(
          key: _investigationFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("CBC:",
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
                              groupValue: cbc,
                              onChanged: (value) {
                                setState(() {
                                  cbc = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: cbc,
                              onChanged: (value) {
                                setState(() {
                                  cbc = value;
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
                        child: Text("CBC with Differential:",
                            style: Theme.of(context).textTheme.bodySmall),
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
                              groupValue: cbc_diff,
                              onChanged: (value) {
                                setState(() {
                                  cbc_diff = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: cbc_diff,
                              onChanged: (value) {
                                setState(() {
                                  cbc_diff = value;
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
                        child: Text("Sodium:",
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
                              groupValue: sodium,
                              onChanged: (value) {
                                setState(() {
                                  sodium = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: sodium,
                              onChanged: (value) {
                                setState(() {
                                  sodium = value;
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
                        child: Text("Potassium:",
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
                              groupValue: potassium,
                              onChanged: (value) {
                                setState(() {
                                  potassium = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: potassium,
                              onChanged: (value) {
                                setState(() {
                                  potassium = value;
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
                        child: Text("Urea:",
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
                              groupValue: urea,
                              onChanged: (value) {
                                setState(() {
                                  urea = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: urea,
                              onChanged: (value) {
                                setState(() {
                                  urea = value;
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
                        child: Text("Creatinine:",
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
                              groupValue: creatinine,
                              onChanged: (value) {
                                setState(() {
                                  creatinine = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: creatinine,
                              onChanged: (value) {
                                setState(() {
                                  creatinine = value;
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
                        child: Text("BUN:",
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
                              groupValue: bun,
                              onChanged: (value) {
                                setState(() {
                                  bun = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: bun,
                              onChanged: (value) {
                                setState(() {
                                  bun = value;
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
                        child: Text("Random Blood Sugar:",
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
                              groupValue: rand_bloodsugar,
                              onChanged: (value) {
                                setState(() {
                                  rand_bloodsugar = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: rand_bloodsugar,
                              onChanged: (value) {
                                setState(() {
                                  rand_bloodsugar = value;
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
                        child: Text("HbA1C:",
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
                              groupValue: hba1c,
                              onChanged: (value) {
                                setState(() {
                                  hba1c = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: hba1c,
                              onChanged: (value) {
                                setState(() {
                                  hba1c = value;
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
                        child: Text("Fasting Blood Sugar:",
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
                              groupValue: fasting_bloodsugar,
                              onChanged: (value) {
                                setState(() {
                                  fasting_bloodsugar = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: fasting_bloodsugar,
                              onChanged: (value) {
                                setState(() {
                                  fasting_bloodsugar = value;
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
                        child: Text("PPBS:",
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
                              groupValue: ppbs,
                              onChanged: (value) {
                                setState(() {
                                  ppbs = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: ppbs,
                              onChanged: (value) {
                                setState(() {
                                  ppbs = value;
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
                        child: Text("Calcium:",
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
                              groupValue: calcium,
                              onChanged: (value) {
                                setState(() {
                                  calcium = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: calcium,
                              onChanged: (value) {
                                setState(() {
                                  calcium = value;
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
                        child: Text("Lipid Profile:",
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
                              groupValue: lipid_profile,
                              onChanged: (value) {
                                setState(() {
                                  lipid_profile = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: lipid_profile,
                              onChanged: (value) {
                                setState(() {
                                  lipid_profile = value;
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
                        child: Text("Total Cholestrol:",
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
                              groupValue: cholestrol,
                              onChanged: (value) {
                                setState(() {
                                  cholestrol = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: cholestrol,
                              onChanged: (value) {
                                setState(() {
                                  cholestrol = value;
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
                        child: Text("Triglycerides:",
                            style: Theme.of(context).textTheme.bodySmall),
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
                              groupValue: triglycerides,
                              onChanged: (value) {
                                setState(() {
                                  triglycerides = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: triglycerides,
                              onChanged: (value) {
                                setState(() {
                                  triglycerides = value;
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
                        child: Text("HDL:",
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
                              groupValue: hdl,
                              onChanged: (value) {
                                setState(() {
                                  hdl = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: hdl,
                              onChanged: (value) {
                                setState(() {
                                  hdl = value;
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
                        child: Text("VLDL:",
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
                              groupValue: vldl,
                              onChanged: (value) {
                                setState(() {
                                  vldl = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: vldl,
                              onChanged: (value) {
                                setState(() {
                                  vldl = value;
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
                        child: Text("Ratio:",
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
                              groupValue: ratio,
                              onChanged: (value) {
                                setState(() {
                                  ratio = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child: RadioListTile(
                              title: const Text("No"),
                              value: 2,
                              groupValue: ratio,
                              onChanged: (value) {
                                setState(() {
                                  ratio = value;
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
                        child: Text("Other:",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: other,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Other"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
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
                              if (_investigationFormKey.currentState!
                                  .validate()) {
                                onSave();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'All the Patient Data of ${widget.patientID} is Entered')),
                                );
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => NurseDashboard()),
                                    (route) => false);
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
                            child: Text("Submit"))),
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
