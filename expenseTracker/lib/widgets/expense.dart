import 'package:expensetracker/widgets/charts/chart.dart';
import 'package:expensetracker/widgets/expenses_List/expenseList.dart';
import 'package:flutter/material.dart';

import '../modals/expenseData.dart';
import 'new_expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseData> _registeredExpenses = <ExpenseData>[
    ExpenseData(
        title: "Juice", amt: 50, date: DateTime.now(), category: Category.food),
    ExpenseData(
        title: "Salaar Movie",
        amt: 120,
        date: DateTime.now(),
        category: Category.leisure),
    ExpenseData(
        title: "Grocery",
        amt: 89.9,
        date: DateTime.now(),
        category: Category.food),
    ExpenseData(
        title: "Fuel",
        amt: 1050,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void addExpense() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(ExpenseData expenseData) {
    setState(() {
      _registeredExpenses.add(expenseData);
    });
  }

  void _deleteExpense(ExpenseData expenseData) {
    final expenseIndex = _registeredExpenses.indexOf(expenseData);
    setState(() {
      _registeredExpenses.remove(expenseData);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${expenseData.title} deleted"),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenseData);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget mainContent =
        Center(child: Text("No expenses found, Start adding some!!!"));
    if (_registeredExpenses.isNotEmpty) {
      setState(() {
        mainContent = ExpensesList(
          expenseData: _registeredExpenses,
          onDeleteExpense: (ExpenseData expenseData) {
            _deleteExpense(expenseData);
          },
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expense Tracker"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: addExpense,
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: screenWidth < screenHeight
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
