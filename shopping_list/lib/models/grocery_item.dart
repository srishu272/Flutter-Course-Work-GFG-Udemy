
import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

class GroceryItem{
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem({required this.name, required this.id, required this.category,required this.quantity,});
}