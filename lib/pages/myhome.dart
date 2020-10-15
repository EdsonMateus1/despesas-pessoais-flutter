import 'dart:math';

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final _transactions = [];

  void _addTrasaction(String title, double value) {
    final newTrasaction = Transaction(
        date: DateTime.now(),
        id: Random().nextDouble().toString(),
        title: title,
        value: value);
    setState(() {
      _transactions.add(newTrasaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
