import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  TransactionForm({@required this.onSubmit});
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();
  DateTime _selectDate = DateTime.now();

  _submitForm() {
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        if (pickedDate == null) {
          _selectDate = DateTime.now();
        } else {
          _selectDate = pickedDate;
        }
      });
    }).catchError((onError) {
      print("_showDatePicker" + onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 200 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleControler,
                onSubmitted: (_) => _submitForm(),
                style: Theme.of(context).textTheme.headline4,
                decoration: InputDecoration(
                  labelText: "TITLE",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _valueControler,
                onSubmitted: (_) => _submitForm(),
                style: Theme.of(context).textTheme.headline4,
                decoration: InputDecoration(
                  labelText: "VALUE (R\$)",
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: FlatButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: _submitForm,
                      child: Text(
                        "Nova Transacao",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: _showDatePicker,
                      child: Text(
                        DateFormat("dd/MMM/y").format(_selectDate),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
