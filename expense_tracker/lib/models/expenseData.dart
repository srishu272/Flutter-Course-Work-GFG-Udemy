import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
enum Category {food, travel, leisure, work }
const categoryIcons = {
  Category.food : Icons.fastfood_outlined,
  Category.travel : Icons.airplanemode_active_outlined,
  Category.leisure : Icons.movie_outlined,
  Category.work : Icons.work_outline
};

class ExpenseData {
  final String id;
  final String title;
  final double amt;
  final DateTime date;
  final Category category;

  ExpenseData({
    required this.title,
    required this.amt,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final formatter = DateFormat.yMd();
  String get formattedDate{
    return formatter.format(date);
  }
}
