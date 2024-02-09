import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestigationRequisition extends StatefulWidget {
  const InvestigationRequisition({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _investigationFormKey,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text("Investigation Requisition",
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
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "CBC:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: cbc,
                            onChanged: (value) {
                              setState(() {
                                cbc = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "CBC with Differential:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: cbc_diff,
                            onChanged: (value) {
                              setState(() {
                                cbc_diff = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Sodium:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: sodium,
                            onChanged: (value) {
                              setState(() {
                                sodium = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Potassium:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: potassium,
                            onChanged: (value) {
                              setState(() {
                                potassium = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Urea:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: urea,
                            onChanged: (value) {
                              setState(() {
                                urea = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Creatinine:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: creatinine,
                            onChanged: (value) {
                              setState(() {
                                creatinine = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "BUN:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: bun,
                            onChanged: (value) {
                              setState(() {
                                bun = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Random Blood Sugar:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: rand_bloodsugar,
                            onChanged: (value) {
                              setState(() {
                                rand_bloodsugar = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "HbA1C:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: hba1c,
                            onChanged: (value) {
                              setState(() {
                                hba1c = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Fasting Blood Sugar:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: fasting_bloodsugar,
                            onChanged: (value) {
                              setState(() {
                                fasting_bloodsugar = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "PPBS:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: ppbs,
                            onChanged: (value) {
                              setState(() {
                                ppbs = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Calcium:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: calcium,
                            onChanged: (value) {
                              setState(() {
                                calcium = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Lipid Profile:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: lipid_profile,
                            onChanged: (value) {
                              setState(() {
                                lipid_profile = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Total Cholestrol:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: cholestrol,
                            onChanged: (value) {
                              setState(() {
                                cholestrol = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Triglycerides:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: triglycerides,
                            onChanged: (value) {
                              setState(() {
                                triglycerides = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "HDL:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: hdl,
                            onChanged: (value) {
                              setState(() {
                                hdl = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "VLDL:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: vldl,
                            onChanged: (value) {
                              setState(() {
                                vldl = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Ratio:",
                        style: TextStyle(fontSize: 15),
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
                            groupValue: ratio,
                            onChanged: (value) {
                              setState(() {
                                ratio = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 110,
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
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 105,
                      child: Text(
                        "Other:",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: other,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Other"),
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
                            if (_investigationFormKey.currentState!
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
          ),
        ),
      ),
    );
  }
}
