import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood_outlined,
  Category.travel: Icons.airplanemode_active_outlined,
  Category.leisure: Icons.movie_outlined,
  Category.work: Icons.work_outline
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

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenseData});

  ExpenseBucket.forCategory(List<ExpenseData> allExpenses, this.category)
      : expenseData = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<ExpenseData> expenseData;

  double get totalExpenses {
    double sum = 0;
    for (final i in expenseData) {
      sum += i.amt;
    }
    return sum;
  }
}
