import 'dart:io';

import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/provider/user_places.dart';
import 'package:favourite_places/widgets/imageInput.dart';
import 'package:favourite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlacesScreen extends ConsumerStatefulWidget {
  const AddPlacesScreen({super.key});

  @override
  ConsumerState<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends ConsumerState<AddPlacesScreen> {
  final _addItemkey = new GlobalKey<FormState>();
  final _placeTitle = TextEditingController();
  File? _takenImage;
  String enteredTitle = "";

  @override
  void dispose() {
    _placeTitle.dispose();
    super.dispose();
  }

  void onSave() {
    if (_addItemkey.currentState!.validate()) {
      setState(() {
        enteredTitle = _placeTitle.text;
      });
      ref.read(userPlacesProvider.notifier).addPlace(enteredTitle,_takenImage!);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Form(
        key: _addItemkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _placeTitle,
                decoration: InputDecoration(
                  label: Text("Title"),
                ),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter valid name";

                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ImageInput(onPickImage: (image){
              _takenImage = image;
            },),

            SizedBox(
              height: 10,
            ),
            LocationInput_Widget(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _addItemkey.currentState?.reset();
                    },
                    child: Text("Reset")),
                ElevatedButton(onPressed: onSave, child: Text("Save"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
