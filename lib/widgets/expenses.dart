import 'package:expense_tracker/new_expanse.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpansesState();
  }
}

class _ExpansesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Obed",
        amount: 10,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Medicine",
        amount: 200,
        date: DateTime.now(),
        category: Category.food),
  ];
  void _openAddExpenseOverlay(){
  showModalBottomSheet(context: context, builder: (ctx) =>const NewExpanse());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Flutter expense tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('data'),
          Expanded(
              child: ExpensesList(
            expenses: _registeredExpenses,
          )),
        ],
      ),
    );
  }
}
