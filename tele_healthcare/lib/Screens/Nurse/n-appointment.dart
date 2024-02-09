import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Next Appointment",
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: Form(
        key: _appointmentKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 124,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Next          Appointment:",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
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
                  SizedBox(
                    width: 127,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Notes:",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
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
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            if (_appointmentKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
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
