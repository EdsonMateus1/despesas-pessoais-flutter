import 'dart:math';
import 'package:expenses/models/transactions.dart';

final transactionData = [
  Transaction(
    date: DateTime.now(),
    id: Random().nextDouble().toString(),
    title: "conta de agua",
    value: 150.20,
  ),
  Transaction(
    date: DateTime.now(),
    id: Random().nextDouble().toString(),
    title: "conta de luz",
    value: 200.50,
  ),
];
