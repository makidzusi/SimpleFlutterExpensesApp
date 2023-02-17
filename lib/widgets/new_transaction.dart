import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleContoller = TextEditingController();
  final TextEditingController amountContoller = TextEditingController();
  final Function onTransactionAdd;

  NewTransaction({super.key, required this.onTransactionAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(label: Text("Title")),
            controller: titleContoller,
          ),
          TextField(
            decoration: const InputDecoration(label: Text("Amount")),
            controller: amountContoller,
          ),
          Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    onTransactionAdd(titleContoller.text,
                        double.parse(amountContoller.text));
                  },
                  child: const Text("Добавить покупку")))
        ]),
      ),
    );
  }
}
