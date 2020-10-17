import 'package:flutter/material.dart';
import './pages/myhome.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhome(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
