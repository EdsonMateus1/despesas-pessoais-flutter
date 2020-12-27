import 'dart:ui';

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
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orange[900],
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 25,
              ),
              headline2: TextStyle(
                fontFamily: "Roboto",
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 15,
              ),
            ),
      ),
    );
  }
}
