import 'dart:math';
import 'package:expenses/models/transactions.dart';

final transactionData = [
  Transaction(
    date: DateTime.now().subtract(Duration(days: 3)),
    id: Random().nextDouble().toString(),
    title: "conta de agua",
    value: 150,
  ),
  Transaction(
    date: DateTime.now().subtract(Duration(days: 2)),
    id: Random().nextDouble().toString(),
    title: "conta de internet",
    value: 120,
  ),
  Transaction(
    date: DateTime.now().subtract(Duration(days: 1)),
    id: Random().nextDouble().toString(),
    title: "present natal",
    value: 400,
  ),
  Transaction(
    date: DateTime.now(),
    id: Random().nextDouble().toString(),
    title: "conta de luz",
    value: 200,
  ),
];
