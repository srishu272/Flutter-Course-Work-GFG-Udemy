import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expenseData.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function(ExpenseData expenseData) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _title = TextEditingController();
  final _amt = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _datePicker() async {
    DateTime now = new DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveExpense() {
    final amt = double.tryParse(_amt.text);
    final amtIsInvalid = amt == null || amt <= 0;
    if (_title.text
        .trim()
        .isEmpty || amtIsInvalid || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) =>
              AlertDialog(
                title: Text("Invalid Input"),
                content: Text(
                    "Please make sure a valid title, amount, date and category was entered."),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Okay, Close it"))
                ],
              )
      );
      return;
    }
    widget.onAddExpense(
        ExpenseData(
        title: _title.text,
        amt: amt,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _title.dispose();
    _amt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _title,
            decoration: InputDecoration(
              labelText: "Title",
            ),
            maxLength: 50,
            keyboardType: TextInputType.text,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amt,
                  decoration: InputDecoration(
                    prefixText: "Rs ",
                    labelText: "Amount",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null
                          ? "No date Selected"
                          : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: _datePicker,
                          icon: Icon(Icons.calendar_month_outlined))
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((catergory) =>
                      DropdownMenuItem(
                          value: catergory,
                          child: Text(catergory.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              Spacer(),
              ElevatedButton(
                  onPressed: _saveExpense,
                  child: Text("Save Expense")),
              SizedBox(
                width: 6,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ],
          )
        ],
      ),
    );
  }
}
