import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import '../components//transaction_form.dart';
import '../components/transaction_list.dart';
import '../data/transaction_data.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final List<Transaction> _transactions = transactionData;

  void _addTrasaction(String title, double value) {
    final newTrasaction = Transaction(
        date: DateTime.now(),
        id: Random().nextDouble().toString(),
        title: title,
        value: value);
    setState(() {
      _transactions.add(newTrasaction);
    });
    Navigator.of(context).pop();
  }

  List<Transaction> get _recentTrasaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _showModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          onSubmit: _addTrasaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Chart(
              recentsTransaction: _recentTrasaction,
            ),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalForm(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
