import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:google_fonts/google_fonts.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final _appointmentKey = GlobalKey<FormState>();
  final _nextAppointment = TextEditingController();
  final _notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _appointmentKey,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
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
                      width: 200,
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
                              border: OutlineInputBorder(), labelText: "Notes"),
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
                            if (_appointmentKey.currentState!.validate()) {
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
          ),
        ),
      ),
    );
  }
}
