import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onTransactionAdd;

  const NewTransaction({super.key, required this.onTransactionAdd});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleContoller = TextEditingController();
  final TextEditingController _amountContoller = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final title = _titleContoller.text;
    final amount = double.tryParse(_amountContoller.text);

    if (title.isEmpty ||
        amount == null ||
        _selectedDate == null ||
        amount <= 0) {
      return;
    }

    widget.onTransactionAdd(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(label: Text("Title")),
            controller: _titleContoller,
            onSubmitted: (_) => _submitData,
          ),
          TextField(
            decoration: const InputDecoration(label: Text("Amount")),
            controller: _amountContoller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_selectedDate == null
                  ? "No date choosen"
                  : DateFormat.yMMMEd().format(_selectedDate!)),
              TextButton(
                child: const Text("Choose date"),
                onPressed: () {
                  _showDatePicker();
                },
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    _submitData();
                  },
                  child: const Text("Добавить покупку")))
        ]),
      ),
    );
  }
}
