import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Billing extends StatefulWidget {
  const Billing({super.key});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  final _billingFormKey = GlobalKey<FormState>();
  final _nurseVisitDay = TextEditingController();
  var _selectedValue;
  final _bp = TextEditingController();
  final _physician = TextEditingController();
  final _dietician = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _billingFormKey,
      child: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Billing",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Nurse Visit Day:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 275,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Nurse Visit Day";

                          return null;
                        },
                        controller: _nurseVisitDay,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nurse Visit Day"),
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
                    "Procedure Done:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        child: RadioListTile(
                          title: const Text("Yes"),
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 150,
                        child: RadioListTile(
                          title: const Text("No"),
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
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
                    "BP:",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 93),
                  child: SizedBox(
                    width: 275,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter BP";

                          return null;
                        },
                        controller: _bp,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "BP"),
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
                      "Physician Consultation:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    width: 275,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Physician Consultation";

                          return null;
                        },
                        controller: _physician,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Physician Consultation"),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 105,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Dietician Consultaion:",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 34),
                  child: SizedBox(
                    width: 271,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please Enter Dietician Consultation";

                          return null;
                        },
                        controller: _dietician,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Dietician Consultation"),
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
                        if (_billingFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: Text("Done"))),
            )
          ],
        )),
      ),
    );
  }
}
