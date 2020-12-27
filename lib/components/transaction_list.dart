import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "Nenhuma transacao cadastrada",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          "\$${tr.value.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    subtitle: Text(
                      DateFormat("d/MMM/y").format(tr.date),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
