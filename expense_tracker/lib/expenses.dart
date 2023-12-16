import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Yabancı Dil Kursu",
        amount: 2000,
        date: DateTime.now(),
        category: Category.okul),
    Expense(
        title: "Steam",
        amount: 750,
        date: DateTime.now(),
        category: Category.keyif)
  ];

  void _openAddExpenseOverplay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Harcama Kontrol"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverplay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("Grafik"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
