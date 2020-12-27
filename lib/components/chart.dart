import 'dart:io';

import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //
  final List<Transaction> recentsTransaction;

  Chart({this.recentsTransaction});

  List<Map<String, Object>> get _groupedTrasaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      final day = DateFormat.E().format(weekDay)[0];
      double totalSum = 0.0;

      for (var recentTransaction in recentsTransaction) {
        bool sameDay = recentTransaction.date.day == weekDay.day;
        bool sameMonth = recentTransaction.date.month == weekDay.month;
        bool sameYear = recentTransaction.date.year == weekDay.year;
        if (sameYear && sameMonth && sameDay) {
          totalSum += recentTransaction.value;
        }
      }

      return {
        "day": day,
        "value": totalSum,
      };
    });
  }

  double get _weekTotalValue {
    return _groupedTrasaction.fold(0.0, (sum, tr) {
      return sum + (tr["value"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _groupedTrasaction.map((tr) {
          return ChartBar(
            value: tr["value"],
            day: tr["day"],
            percentage: (tr["value"] as double) / _weekTotalValue,
          );
        }).toList(),
      ),
    );
  }
}
