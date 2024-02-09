import 'package:expense_tracker/models/expenseData.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {Key? key, required this.expenseData, required this.onDeleteExpense})
      : super(key: key);

  final List<ExpenseData> expenseData;
  final void Function(ExpenseData expenseData) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseData.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: Theme.of(context).cardTheme.margin,
            ),
            key: ValueKey(expenseData[index]),
            onDismissed: (direction) {
              onDeleteExpense(expenseData[index]);
            },
            child: ExpenseItem(expense: expenseData[index]));
      },
    );
  }
}
