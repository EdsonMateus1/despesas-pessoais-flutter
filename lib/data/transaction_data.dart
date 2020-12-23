import 'dart:math';
import 'package:expenses/models/transactions.dart';

final transactionData = [
  Transaction(
      date: DateTime.now(),
      id: Random().nextDouble().toString(),
      title: "teste",
      value: 100.50),
  Transaction(
      date: DateTime.now(),
      id: Random().nextDouble().toString(),
      title: "teste",
      value: 100.50),
];
