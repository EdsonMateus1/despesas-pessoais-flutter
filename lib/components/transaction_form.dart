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

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: titleControler,
                onSubmitted: (_) => _submitForm(),
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "TITLE",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: valueControler,
                onSubmitted: (_) => _submitForm(),
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "VALUE (R\$)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(15.0),
                  color: Theme.of(context).accentColor,
                  onPressed: _submitForm,
                  child: Text(
                    "Nova Trasacao",
                    style: Theme.of(context).textTheme.headline2,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
