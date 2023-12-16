import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { yiyecek, gezi, keyif, okul }

const categoryIcons = {
  Category.yiyecek: Icons.lunch_dining,
  Category.gezi: Icons.flight_takeoff,
  Category.keyif: Icons.movie,
  Category.okul: Icons.school,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
