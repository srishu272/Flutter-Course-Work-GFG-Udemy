import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/widgets/new_item.dart';
import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https('shopping-list-1d0a3-default-rtdb.firebaseio.com',
        'shopping-list.json');

    try{
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to fetch data.Please try again later";
        });
      }
      if(response.body == 'null'){
        setState(() {
          _isLoading = false;
        });
        return;

      }
      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedList = [];
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (element) => element.value.categoryType == item.value['category'])
            .value;
        loadedList.add(GroceryItem(
            name: item.value['name'],
            id: item.key,
            category: category,
            quantity: item.value['quantity']));
      }
      setState(() {
        _groceryItems = loadedList;
        _isLoading = false;
      });
    }catch(errro){
      setState(() {
        _error = "Something went wrong";
      });
    }


  }

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));

    if (newItem == null) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _deleteItem(GroceryItem item) async{
    final indexOfItem = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https('shopping-list-1d0a3-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);

    if(response.statusCode >= 400){
      setState(() {
        _groceryItems.insert(indexOfItem, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(child: const Text("No items added yet..."));

    if (_isLoading) {
      mainContent = Center(child: CircularProgressIndicator());
    }
    if (_groceryItems.isNotEmpty) {
      mainContent = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItems[index].id),
                onDismissed: (direction) {
                  _deleteItem(_groceryItems[index]);
                },
                child: ListTile(
                  title: Text(_groceryItems[index].name),
                  leading: Container(
                    width: 20,
                    height: 20,
                    color: _groceryItems[index].category.color,
                  ),
                  trailing: Text(_groceryItems[index].quantity.toString()),
                ),
              ));
    }
    if (_error != null) {
      mainContent = Center(child: Text(_error!));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Grocery"),
          actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
        ),
        body: mainContent);
  }
}
