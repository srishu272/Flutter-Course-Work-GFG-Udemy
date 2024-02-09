import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = new GlobalKey<FormState>();
  var name = '';
  var quantity = 1;
  var _selectedCategory = categories[Categories.vegetables];
  bool _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _isSending = true;
      _formKey.currentState!.save();
      final url = Uri.https('shopping-list-1d0a3-default-rtdb.firebaseio.com',
          'shopping-list.json');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'name': name,
            'category': _selectedCategory?.categoryType,
            'quantity': quantity
          }));

      final resData = json.decode(response.body);
      if (!context.mounted) {
        return;
      }
      // response.statusCode == 200
      Navigator.of(context).pop(GroceryItem(
          name: name,
          id: resData['name'],
          category: _selectedCategory!,
          quantity: quantity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new item"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text("Name")),
                validator: (value) {
                  if (value!.isEmpty ||
                      value == null ||
                      value.trim().length <= 1) return "Enter a valid name";
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Quantity"),
                      ),
                      initialValue: quantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty ||
                            value == null ||
                            int.tryParse(value)! == null ||
                            int.tryParse(value)! <= 0)
                          return "Enter a valid quantity";
                        return null;
                      },
                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: categories.entries.map((category) {
                            return DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: category.value.color,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(category.value.categoryType)
                                  ],
                                ));
                          }).toList(),
                          onChanged: (value) {
                            _selectedCategory = value;
                          }))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: Text("Reset")),
                  ElevatedButton(
                      onPressed: _isSending ? null : _saveItem,
                      child: _isSending
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())
                          : Text("Add Item"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
