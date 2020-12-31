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

  void _addTrasaction(String title, double value, DateTime date) {
    final newTrasaction = Transaction(
      date: date,
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
    );
    setState(() {
      _transactions.add(newTrasaction);
    });
    Navigator.of(context).pop();
  }

  void _removeTrasaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
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
    final appBar = AppBar(
      title: Text(
        "EXPENSES",
        style: Theme.of(context).appBarTheme.textTheme.headline1,
      ),
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    print(availableHeight);
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: availableHeight * 0.30,
            child: Chart(
              recentsTransaction: _recentTrasaction,
            ),
          ),
          Container(
            height: availableHeight * 0.70,
            child: TransactionList(
              transactions: _transactions,
              onRemove: _removeTrasaction,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalForm(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
