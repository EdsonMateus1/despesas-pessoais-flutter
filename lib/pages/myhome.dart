import 'dart:math';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import '../components//transaction_form.dart';
import '../components/transaction_list.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final List<Transaction> _transactions = [
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

  void _showModalForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmit: _addTrasaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              // dasboard
              height: 100,
              child: Card(
                  //color: Theme.of(context).primaryColor,
                  elevation: 5,
                  child: Center(
                      child: Text(
                    "dasboard",
                    style: TextStyle(fontSize: 40),
                  )))),
          TransactionList(transactions: _transactions),
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
