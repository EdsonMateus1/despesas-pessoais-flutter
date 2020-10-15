import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm({@required this.onSubmit});
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleControler,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(labelText: "TITLE"),
            ),
            TextField(
              controller: valueControler,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(labelText: "VALUE (R\$)"),
            ),
            RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  final title = titleControler.text;
                  final value = double.tryParse(valueControler.text) ?? 0.0;
                  widget.onSubmit(title, value);
                },
                child: Text(
                  "nova transacao",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
